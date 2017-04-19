class MakersBnB < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/users/new'
  end
end
