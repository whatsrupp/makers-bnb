feature 'create new booking' do
  scenario 'User creates a booking' do
    add_new_space
    click_on 'Book'
    fill_in :start_date, with: '15/09/2017'
    fill_in :end_date, with: '20/09/2017'
    click_on 'Book'
    expect(page).to have_content('The Bakery has been booked')
  end
end
