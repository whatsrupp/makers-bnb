module RequestHelpers
  def make_space_and_submit_request(name: 'WAGWAN', start_date: '15/09/2017', end_date: '20/09/2017')
    sign_up
    add_new_space(name: name)
    click_on name
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    click_on 'Request'
  end

  def submit_request(name: 'WAGWAN', start_date: '15/09/2017', end_date: '20/09/2017')
    sign_up
    click_on name
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    click_on 'Request'
  end
end
