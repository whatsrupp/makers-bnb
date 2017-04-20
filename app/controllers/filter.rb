class MakersBnB < Sinatra::Base

  post '/filter' do
    @city = params[:location]
    redirect "/filter/#{@city}"
  end

  get '/filter/:location' do
    filter = Space.all
    @spaces = filter.select { |space| space if space.location == params[:location]}
    erb :'spaces/index'
  end

end
