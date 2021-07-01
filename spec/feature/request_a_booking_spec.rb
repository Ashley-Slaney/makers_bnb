

feature "user request a booking" do
  scenario "request a booking on listed space" do
    visit('/spaces')
    
    #page.find('card-body', text: 'Enter your request details')
    #click_button('Request booking')
    expect(page).to have_content('Enter your request details')
    expect(current_path).to eq('/spaces')
  end
end

#page.find('div', text: 'Expected content')
