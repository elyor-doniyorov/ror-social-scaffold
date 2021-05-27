require 'rails_helper'

RSpec.describe 'the signin process', type: :system do
  before do
    driven_by(:rack_test)
  end
  it 'send friend request' do
    user1 = User.create(name: 'elyor', email: 'test_user1@email.com', password: '123456')
    User.create(name: 'elyor1', email: 'test_user2@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit users_path
    click_button 'Send request'
    expect(page).to have_text('Friend request sent')
  end
  it 'can not see button when already sent' do
    user1 = User.create(name: 'elyor', email: 'testuser1@email.com', password: '123456')
    User.create(name: 'elyor1', email: 'testuser2@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit users_path
    click_button 'Send request'
    expect(page).to have_text('Friend request sent')
    visit users_path
    expect(page).not_to have_text('Send request')
  end

  it 'Confirm friend request' do
    user1 = User.create(name: 'elyor', email: 'testuser1@email.com', password: '123456')
    user2 = User.create(name: 'elyor1', email: 'testuser2@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit users_path
    click_button 'Send request'
    expect(page).to have_text('Friend request sent')
    click_button 'Sign out'
    fill_in 'user[email]', with: user2.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit users_path
    click_link 'Confirm'
    expect(page).to have_text('Friend request accepted')
  end

  it 'Deny friend request' do
    user1 = User.create(name: 'elyor', email: 'testuser1@email.com', password: '123456')
    user2 = User.create(name: 'elyor1', email: 'testuser2@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit users_path
    click_button 'Send request'
    expect(page).to have_text('Friend request sent')
    click_button 'Sign out'
    fill_in 'user[email]', with: user2.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit users_path
    click_link 'Deny'
    expect(page).to have_text('Friend request Denied')
  end
end
