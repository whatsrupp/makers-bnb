class MakersBnB < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/users/new'
    else
      return 'error'
      erb :'users/new'
    end
  end

end
