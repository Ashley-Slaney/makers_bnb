feature "user filters list of spaces" do
  scenario "select a date in the calendar" do
    visit('/addnewspace')
    fill_in('name', with: 'Makers')
    fill_in('description', with: 'great')
    fill_in('price', with: '$20')
    fill_in('date_avail', with: '2021/01/01')
    click_button('Submit')
    fill_in('date_avail', with: '2021/01/01')
    click_button('Filter')
    expect(page).to have_content('2021-01-01')
    expect(page).not_to have_content('2021-02-02')
    expect(current_path).to eq('/date_range')
  end
end