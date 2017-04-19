module NewSpaceHelpers

  DEFAULT_NAME = 'The Bakery'
  DEFAULT_LOCATION = 'Old Street'
  DEFAULT_PRICE = '10.90'
  DEFAULT_DESCRIPTION = 'A space near the heart of the city with excellent transport.'

  def add_new_space(name: DEFAULT_NAME,
                        location: DEFAULT_LOCATION,
                        price: DEFAULT_PRICE,
                        description: DEFAULT_DESCRIPTION)

    visit '/spaces/new'
    fill_in('name', with: name)
    fill_in('location', with: location)
    fill_in('price', with: price)
    fill_in('description', with: description)
    click_button 'Submit'

  end


end
