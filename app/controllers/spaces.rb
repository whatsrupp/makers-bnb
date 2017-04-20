class MakersBnB<Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'

  end

  post '/spaces/new' do
    name = params[:name]
    location = params[:location]
    price = params[:price]
    description = params[:description]
    @space = Space.new(name: name, location: location, price: price, description: description)
    @space.save
    redirect '/spaces/index'
  end

  get '/spaces/index' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :'spaces/id'
  end




end
