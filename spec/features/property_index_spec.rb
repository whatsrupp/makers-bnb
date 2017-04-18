feature 'Displaying the saved properties' do

  scenario 'Add multiple properties and see them listed' do

    add_new_property(name: "Rasta Pasta")
    expect(page).to have_content "Rasta Pasta"



    add_new_property(name: "Jerked Turk")
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Jerked Turk"


    add_new_property(name: "Roasty Toasty")
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Rasta Pasta"
    expect(page).to have_content "Rasta Pasta"


  end

end
