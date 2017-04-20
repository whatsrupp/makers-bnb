class MakersBnB < Sinatra::Base

  get ('/requests/index') do
    erb :'requests/index'
  end

  post ('/requests/new') do
    start_date = params[:start_date]
    end_date = params[:end_date]
    requester_id = current_user.id
    space_id = params[:id]
    Request.create(requested_start: start_date,
                    requested_end: end_date,
                    user_id: requester_id,
                    space_id: space_id
                  )
    flash.keep[:requests]=Space.first(id: space_id).name
    redirect '/spaces/index'
  end
end
