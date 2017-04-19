feature 'Interacting with the header' do

  describe 'Context: User is signed in' do

    scenario 'user navigates to the spaces index page' do
      visit '/'
      click_link 'spaces-link'
      expect(current_path).to eq '/spaces/index'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Spaces'
    end

    scenario 'user navigates to the requests page' do
      visit '/'
      click_link 'requests-link'
      expect(current_path).to eq '/requests/index'
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Requests'
    end


  end
end
