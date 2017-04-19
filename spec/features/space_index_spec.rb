feature 'Displaying the saved spaces' do

  scenario 'Add multiple spaces and see them listed' do

    add_new_space(name: "Rasta Pasta")
    expect(page).to have_content "Rasta Pasta"



    add_new_space(name: "Jerked Turk")
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Jerked Turk"


    add_new_space(name: "Roasty Toasty")
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Rasta Pasta"


  end

  scenario 'Click on space and go to its space page' do
    name = "Roast and Toast"
    add_new_space(name: name)
    expect(page).to have_content name
    click_link(name)
    expect(current_path).to eq "/spaces/#{Space.first(name: name).id}"
    expect(page.status_code).to eq(200)
  end

end
