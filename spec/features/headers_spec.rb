feature 'Interacting with the header' do

  scenario 'user navigates to the properties index page' do
    visit '/'
    click_button 'Properties'
    expect(current_path).to eq '/properties/index'
  end

end
