feature 'Interacting with the header' do

  describe 'Context: User is signed in' do

    scenario 'user navigates to the properties index page' do
      sign_up
      visit '/'
      click_link 'properties-link'
      expect(current_path).to eq '/properties/index'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Properties'
      expect(page).not_to have_content 'Login'
    end

    scenario 'user navigates to the requests page' do
      sign_up
      visit '/'
      click_link 'requests-link'
      expect(current_path).to eq '/requests/index'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Requests'
      expect(page).not_to have_content 'Login'
    end

  end

  describe 'Context: User is signed out' do

    scenario 'user navigates to login page' do
      visit '/'
      click_link 'login-link'
      expect(current_path).to eq '/sessions/new'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'sign in'
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

  end
end
