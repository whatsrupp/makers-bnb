feature 'Displaying the saved spaces' do

  before(:each) do
    sign_up
  end

  scenario 'Add multiple spaces and see them listed' do
    add_new_space(name: "Rasta Pasta")
    expect(page).to have_content "Rasta Pasta"

    add_new_space(name: "Jerked Turk")
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Jerked Turk"

    add_new_space(name: "Roasty Toasty")
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Jerked Turk"
    expect(page).to have_content "Roasty Toasty"
  end

  scenario 'Can navigate to new space page' do
    visit '/spaces/index'
    click_button 'new-spaces-button'
    expect(current_path).to eq '/spaces/new'
    expect(page.status_code).to eq(200)
  end

  scenario 'Click on space and go to its space page' do
    name = "Roast and Toast"
    add_new_space(name: name)
    expect(page).to have_content name
    click_link(name)
    expect(current_path).to eq "/spaces/#{Space.first(name: name).id}"
    expect(page.status_code).to eq(200)
  end

  scenario 'Users can search spaces by city' do
    sign_up
    add_new_space(name: "Roasty Toasty", location: 'London')
    add_new_space(name: "Rasta Pasta", location: 'London')
    add_new_space(name: "Posh Nosh", location: 'Paris')
    add_new_space(name: "Chilli Curry", location: 'Manchester')
    add_new_space(name: "Fish and Chips", location: 'Manchester')

    fill_in :'filter-location-search', with: 'London'
    click_on 'Search'

    expect(page.status_code).to eq(200)
    expect(page).to have_content('Roasty Toasty')
    expect(page).to have_content('Rasta Pasta')
    expect(page).not_to have_content('Posh Nosh')
    expect(page).not_to have_content('Chilli Curry')
    expect(page).not_to have_content('Fish and Chips')
  end


  scenario 'User can order spaces by price' do
    sign_up
    add_new_space(name: "Roasty Toasty", price: '10')
    add_new_space(name: "Rasta Pasta", price: '200')
    add_new_space(name: "Posh Nosh", price: '30')
    add_new_space(name: "Chilli Curry", price: '1')

    click_on 'Filter by Highest Price'

    expect(page.status_code).to eq(200)
    expect(current_path).to eq'/filter/price-high'
    expect(page).to have_content("Chilli Curry")

  end

end
