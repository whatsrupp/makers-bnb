require './app/models/user'

describe User do
  let!(:user) do
    User.create(email: 'hello@hello.com', password: 'password123')
  end
  
end
