class MakersBnB < Sinatra::Base

  get '/filter/' do
    redirect '/spaces/index'
  end

  post '/filter' do
    @city = params[:location]
    redirect "/filter/#{@city}"
  end

  get '/filter/price' do
    filter = Space.all
    @spaces = filter.sort_by { |space| space.price.to_i }
    erb :'spaces/index'
  end

  get '/filter/:location' do
    filter = Space.all
    @spaces = filter.select { |space| space.location if space.location == params[:location]}
    erb :'spaces/index'
  end




end
