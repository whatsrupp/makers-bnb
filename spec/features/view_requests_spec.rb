feature 'Viewing requests' do
  scenario 'User can view all requests that they have made' do
    make_space_and_submit_request(name: 'house1')
    make_space_and_submit_request(name: 'house2')
    visit '/requests/index'
    expect(page).to have_content 'house1'
    expect(page).to have_content 'house2'
  end

  scenario 'User can view all requests for their space' do
    sign_up(email: 'woody@wood.com')
    add_new_space(name: "Rasta Pasta")
    click_button('sign-out-button')
    submit_request(name: "Rasta Pasta")
    click_button('sign-out-button')
    sign_in(email: 'woody@wood.com')
    visit '/requests/index'
    expect(page).to have_content 'Rasta Pasta'
  end
end
