feature 'Creating new user' do
  scenario 'Creating new user increases number of users' do
    expect{sign_up(email: "brick@roll.com")}.to change(User, :count).by(1)
    expect(current_path).to eq '/spaces/index'
    expect(page).to have_content "Welcome, brick@roll.com "
  end

  scenario "with an invalid email address" do
    expect { sign_up(email: 'test@test') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "with an already registered email address" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end

feature 'User sign in' do
  scenario 'with correct credentials' do
    sign_up(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in(email: 'test@test.com',   password: 'password')
    expect(page).to have_content "Welcome, test@test.com"
  end
end

feature 'User signs out' do
  scenario 'while being signed in' do
    sign_up(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in(email: 'test@test.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('goodbye')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
