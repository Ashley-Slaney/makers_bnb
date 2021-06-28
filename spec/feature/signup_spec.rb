require 'spec_helper'

feature 'sign up' do
  scenario 'user can sign up and sign in' do 
    visit('/')
    fill_in('email', with: 'test@gmail.com')
    fill_in('password', with: 'test123')
    fill_in('confirmation', with: 'test123')
    click_button('Sign up')
    expect(page.current_path).to eq('/spaces')
    expect(page).to have_content('Welcome to Makers BnB, test@gmail.com')
  end
end
