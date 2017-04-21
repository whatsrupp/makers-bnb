class MakersBnB < Sinatra::Base

  get ('/requests/index') do
    requests = Request.all
    @requests = requests.select {|request| request if request[:user_id] == current_user.id}
    spaces = Space.all
    @spaces = spaces.select {|space| space if space[:user_id] == current_user.id}
    erb :'requests/index'
  end

  post ('/requests/new') do
    start_date = params[:start_date]
    end_date = params[:end_date]
    requester_id = current_user.id
    space_id = params[:id]
    Request.create(start_date: start_date,
                    end_date: end_date,
                    user_id: requester_id,
                    space_id: space_id
                  )
    flash.keep[:requests]=Space.first(id: space_id).name
    redirect '/spaces/index'
  end

  post '/requests/confirm' do

    flash.keep[:confirmations]= "Space Booking Confirmed"
    request = Request.first(id: params[:'request-id'])
    Space.first(id: request.space_id ).update(:booked => true)
    Request.first(id: params[:'request-id']).update(:confirmed => true)

    requests = Request.all.select {|request| request if request[:space_id] == request.space_id && request[:confirmed]==false}
    requests.map{|request| Request.first(id: request.id).update(:active => false)}


    redirect('/requests/index')
  end

  post '/requests/deny' do
    flash.keep[:confirmations]= "Space Booking Rejected"
    Request.first(id: params[:'request-id']).update(:active=> false)
    redirect('/requests/index')

  end


  get '/requests/:id' do
    @request_id=params[:id]
    erb :'requests/id'
  end


end
