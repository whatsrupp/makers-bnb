class MakersBnB < Sinatra::Base

  get '/filter/:location' do
    filter = Space.all
    @spaces = filter.select! { |space| space.location if space.location == params[:location]}
    erb :'spaces/index'

  end

end
