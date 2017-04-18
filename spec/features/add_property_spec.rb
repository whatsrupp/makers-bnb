feature 'Creating new property' do


  scenario 'User fills out property details and submits' do
    add_new_property

    expect(page).to have_content "Property added"
  end
end
