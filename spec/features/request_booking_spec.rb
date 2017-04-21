feature 'create new booking' do

  scenario 'User fills out calendar for booking request' do
    expect{make_space_and_submit_request}.to change(Request, :count).by(1)
    expect(page).to have_content 'WAGWAN requested'
  end

  scenario 'Click on request and go to its page' do
    space_name = "Rasta Pasta"

    sign_up(email: 'woody@wood.com')
    add_new_space(name: space_name)
    click_button('sign-out-button')

    submit_request(requester_email: "Hasan@sultan.com", space_name: space_name)

    click_button('sign-out-button')

    sign_in(email: 'woody@wood.com')
    visit '/requests/index'
    expect(page).to have_content space_name
    user_id = User.first(email: "Hasan@sultan.com").id
    space_id = Space.first(name: space_name).id
    request_id=Request.first(user_id: user_id, space_id: space_id).id
    click_link("Request-ID-#{request_id}")
    expect(page.status_code).to eq 200
    expect(current_path).to eq "/requests/#{request_id}"

  end

end
