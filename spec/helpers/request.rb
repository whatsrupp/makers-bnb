module RequestHelpers
  def submit_request
    sign_up
    add_new_space(name: 'WAGWAN')
    click_on 'WAGWAN'
    fill_in :start_date, with: '15/09/2017'
    fill_in :end_date, with: '20/09/2017'
    click_on 'Request'
  end
end
