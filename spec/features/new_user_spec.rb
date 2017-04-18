feature 'Creating new user' do
  scenario 'Creating new user increases number of users' do
    visit 'users/new'
    fill_in :email, with: 'hello@hello.com'
    fill_in :password, with: 'password123'
    click_button 'Register'
    expect(page).to have_content "Welcome hello@hello.com"
  end
end
