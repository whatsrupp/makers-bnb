feature 'Creating new property' do


  scenario 'User fills out property details and submits' do
    expect{add_new_property}.to change(Property, :count).by(1)
    expect(page).to have_content "Property Added"

  end

end
