module SessionHelpers

  DEFAULT_EMAIL = 'rick@roll.com'
  DEFAULT_PASSWORD = 'password'

  def sign_up(email: DEFAULT_EMAIL, password: DEFAULT_PASSWORD, password_confirmation: DEFAULT_PASSWORD)
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Register'
  end

  def sign_in(email: DEFAULT_EMAIL, password: DEFAULT_PASSWORD)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
