class MakersBnB < Sinatra::Base

  enable :sessions

  use Rack::MethodOverride

  enable :patial_underscores
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb


end
