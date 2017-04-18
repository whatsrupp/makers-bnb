module SessionHelpers

def sign_up
  visit 'users/new'
  fill_in :email, with: 'hello@hello.com'
  fill_in :password, with: 'password123'
  click_button 'Register'
end

end
