module NewSpaceHelpers

  DEFAULT_NAME = 'The Bakery'
  DEFAULT_LOCATION = 'Old Street'
  DEFAULT_PRICE = '10.90'
  DEFAULT_DESCRIPTION = 'A space near the heart of the city with excellent transport.'
  DEFAULT_START_DATE = '14/09/2017'
  DEFAULT_END_DATE = '16/09/2017'

  def add_new_space(name: DEFAULT_NAME,
                        location: DEFAULT_LOCATION,
                        price: DEFAULT_PRICE,
                        description: DEFAULT_DESCRIPTION,
                        start_date: DEFAULT_START_DATE,
                        end_date: DEFAULT_END_DATE)

    visit '/spaces/new'
    fill_in('name', with: name)
    fill_in('location', with: location)
    fill_in('price', with: price)
    fill_in('description', with: description)
    fill_in('start date', with: start_date)
    fill_in('end date', with: end_date)
    click_button 'Submit'

  end


end
