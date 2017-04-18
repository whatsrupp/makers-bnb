module NewPropertyHelpers

  DEFAULT_NAME = 'The Bakery'
  DEFAULT_LOCATION = 'Old Street'
  DEFAULT_PRICE = '10.90'
  DEFAULT_DESCRIPTION = 'A property near the heart of the city with excellent transport.'

  def add_new_property(name: DEFAULT_NAME,
                        location: DEFAULT_LOCATION,
                        price: DEFAULT_PRICE,
                        description: DEFAULT_DESCRIPTION)

    visit '/properties/new'
    fill_in('name', with: name)
    fill_in('location', with: location)
    fill_in('price', with: price)
    fill_in('description', with: description)
    click_button 'Submit'

  end


end
