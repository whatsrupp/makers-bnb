require './app/models/user'

describe User do
  let!(:user) do
    User.create(email: 'hello@hello.com', password: 'password123', password_confirmation: 'password123')
  end

  it 'authenticates when give a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    authenticated_user = User.authenticate(user.email, 'wrong')
    expect(authenticated_user).to be_nil
  end

end
