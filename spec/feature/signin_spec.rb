require 'spec_helper'

feature 'sign up' do
    scenario 'user can sign up and sign in' do 
        visit('/')
        fill_in('name', with: 'john')
        fill_in('email', with: 'john@gmail.com')
        fill_in('password_one', with: '123')
        fill_in('password_two', with: '123')
        click_button('Sign-up')
        click_button('Sign out')
        click_button('Sign-in')
        fill_in('email', with: 'john@gmail.com')
        fill_in('password', with: '123')
        click_button('Submit')
        expect(page.current_path).to eq('/spaces')
    end    
end
