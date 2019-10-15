require "rails_helper"

RSpec.feature "Login", :type => :feature do 

    scenario 'user gets to log in page and successfully logs in', js: true do
        user
        visit root_path
        find('nav a', text: 'Login').click
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        find('.login-button').click
        expect(page).to have_selector('#user-settings') 
    end 
    
end