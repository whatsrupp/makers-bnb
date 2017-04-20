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

  scenario 'Can filter spaces by city' do
    add_new_space(name: "Roasty Toasty", location: 'London')
    add_new_space(name: "Rasta Pasta", location: 'London')
    add_new_space(name: "Posh Nosh", location: 'Paris')
    add_new_space(name: "Chilli Curry", location: 'Manchester')
    add_new_space(name: "Fish and Chips", location: 'Manchester')

    visit '/filter/London'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Roasty Toasty')
    expect(page).to have_content('Rasta Pasta')
    expect(page).not_to have_content('Posh Nosh')
    expect(page).not_to have_content('Chilli Curry')
    expect(page).not_to have_content('Fish and Chips')

    visit '/filter/Paris'
    expect(page.status_code).to eq(200)
    expect(page).not_to have_content('Roasty Toasty')
    expect(page).not_to have_content('Rasta Pasta')
    expect(page).to have_content('Posh Nosh')
    expect(page).not_to have_content('Chilli Curry')
    expect(page).not_to have_content('Fish and Chips')

    visit '/filter/Manchester'
    expect(page.status_code).to eq(200)
    expect(page).not_to have_content('Roasty Toasty')
    expect(page).not_to have_content('Rasta Pasta')
    expect(page).not_to have_content('Posh Nosh')
    expect(page).to have_content('Chilli Curry')
    expect(page).to have_content('Fish and Chips')

  end

  scenario 'Users can search spaces by city' do
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

end
