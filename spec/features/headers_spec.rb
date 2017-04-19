feature 'Interacting with the header' do

  describe 'Context: User is signed in' do
    before(:each) do
      sign_up
    end

   scenario 'user navigates to the spaces index page' do
      click_link 'spaces-link'
      expect(current_path).to eq '/spaces/index'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Spaces'
      expect(page).not_to have_content 'Login'
    end

    scenario 'user navigates to the requests page' do
      click_link 'requests-link'
      expect(current_path).to eq '/requests/index'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Requests'
      expect(page).not_to have_content 'Login'
    end

    scenario 'user can log out from the header' do
      click_button 'sign-out-button'
      expect(current_path).to eq '/users/new'
      expect(page.status_code).to eq(200)
      expect(page).to have_content "sign up"
    end
  end

  describe 'Context: User is signed out' do

    scenario 'user navigates to login page' do
      visit '/'
      click_link 'login-link'
      expect(current_path).to eq '/sessions/new'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Sign In'
      expect(page).not_to have_content 'Requests'
    end

    scenario 'user navigates to about page' do
      visit '/'
      click_link 'about-link'
      expect(current_path).to eq '/about/index'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'About Us'
      expect(page).not_to have_content 'Requests'
    end

    scenario 'User goes to the sign up page' do
      visit '/sessions/new'
      click_link 'sign-up-link'
      expect(current_path).to eq '/users/new'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'sign up'
    end

  end
end
