feature 'Creating new property' do
  DEFAULT_NAME = 'The Bakery'
  DEFAULT_LOCATION = 'Old Street'
  DEFAULT_PRICE = 10.90
  DEFAULT_DESCRIPTION = 'A property near the heart of the city with excellent transport.'

  scenario 'User fills out property details and submits' do
    visit('/properties/new')
    fill_in('name', with: DEFAULT_NAME)
    fill_in('location', with: DEFAULT_LOCATION)
    fill_in('price', with: DEFAULT_PRICE)
    fill_in('description', with: DEFAULT_DESCRIPTION)
    click_button 'Submit'

    expect(page).to have_content "Property added"
  end
end
