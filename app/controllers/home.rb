class MakersBnB<Sinatra::Base

  get '/' do
    if current_user
      redirect '/spaces/index'
    else
      redirect '/users/new'
    end
  end

end
