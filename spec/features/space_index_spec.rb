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

end
