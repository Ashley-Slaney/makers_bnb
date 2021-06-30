feature "user filters list of spaces" do
  scenario "select a date in the calendar" do
    visit('/spaces')
    select '2021/01/01', :from => 'date_avail'
    click_button('Submit')
    expect(page).to have_content('2021/01/01')
    expect(page).not_to have_content('2021/02/02')
    expect(current_path).to eq('/spaces')
  end
end