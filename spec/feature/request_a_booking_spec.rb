

feature "user request a booking" do
  scenario "request a booking on listed space" do
    visit('/spaces')
    fill_in("message", with: 'Can we stay this weekend?')
    click_button('Request booking')
    expect(page).to have_content('Can we stay this weekend?')
    expect(current_path).to eq('/spaces')
  end
end

