class MakersBnB<Sinatra::Base

  get '/properties/new' do
    erb :'properties/new'

  end

  post '/properties/new' do
    name = params[:name]
    location = params[:location]
    price = params[:price]
    description = params[:description]
    @property = Property.new(name: name, location: location, price: price, description: description)
    @property.save
    redirect '/properties/index'
  end

  get '/properties/index' do
    @properties = Property.all
    erb :'properties/index'
  end

end
