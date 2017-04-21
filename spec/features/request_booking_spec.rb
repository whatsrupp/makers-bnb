feature 'create new booking' do


  scenario 'User fills out calendar for booking request' do
    expect{make_space_and_submit_request}.to change(Request, :count).by(1)

    expect(page).to have_content 'WAGWAN requested'
  end



end
