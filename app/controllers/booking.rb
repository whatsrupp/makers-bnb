class MakersBnB < Sinatra::Base
  get '/booking/new' do
    erb :'booking/new'
  end

  post '/booking/new' do
    @space = Space.first(id: params[:id])
    redirect '/booking/new'
  end

  post '/booking' do
    @space.booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date])
    @space.save
    require 'pry'; binding.pry
    erb :'booking/index'
  end
end
