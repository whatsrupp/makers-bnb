class MakersBnB < Sinatra::Base
  get '/booking/new' do
    erb :'booking/new'
  end

  post '/booking/new' do
    redirect '/booking'
  end

  get '/booking' do
    erb :'booking/index'
  end
end
