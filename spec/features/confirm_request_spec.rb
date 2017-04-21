feature "Confirmation of requests" do
  scenario 'Owner of space can confirm a request' do


    space_name = "Rasta Pasta"
    owner_email = 'rick@roll.com'
    requester_email = 'hasan@sultan.com'
    sign_up(email: owner_email)
    add_new_space(name: space_name)
    click_button('sign-out-button')

    submit_request(requester_email: requester_email, space_name: space_name)
    click_button('sign-out-button')
    submit_request(requester_email: "han@brolo.com", space_name: space_name)
    click_button('sign-out-button')

    sign_in(email: owner_email)
    visit '/requests/index'

    user_id = User.first(email: requester_email).id
    space_id = Space.first(name: space_name).id
    confirmed_request=Request.first(user_id: user_id, space_id: space_id)

    click_link("Request-ID-#{confirmed_request.id}")
    expect(page.status_code).to eq 200
    expect(current_path).to eq "/requests/#{confirmed_request.id}"


    click_button 'confirm-request'
    expect(current_path).to eq "/requests/index"
    expect(page).to have_content 'Space Booking Confirmed'
    updated_request=Request.first(id: confirmed_request.id)
    expect(updated_request.confirmed).to eq true




  end
end
