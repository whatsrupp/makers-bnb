class MakersBnB < Sinatra::Base

  get ('/requests/index') do

    erb :'requests/index'
  end
end
