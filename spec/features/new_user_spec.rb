feature 'Creating new user' do
  scenario 'Creating new user increases number of users' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Welcome hello@hello.com"
  end
end
