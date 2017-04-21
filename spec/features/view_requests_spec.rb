feature 'Viewing requests' do
  scenario 'User can view all requests that they have made' do
    make_space_and_submit_request(name: 'house1')
    make_space_and_submit_request(name: 'house2')
    visit '/requests/index'
    expect(page).to have_content 'house1'
    expect(page).to have_content 'house2'
  end

  scenario 'User can view all requests for their space' do
    space_name = "Rasta Pasta"
    owner_email = 'rick@roll.com'
    requester_email = 'hasan@sultan.com'
    sign_up(email: owner_email)
    add_new_space(name: space_name)
    click_button('sign-out-button')

    submit_request(requester_email: requester_email, space_name: space_name)
    click_button('sign-out-button')
    sign_in(email: owner_email)
    visit '/requests/index'
    expect(page).to have_content space_name
  end
end
