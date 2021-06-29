feature "user can add a new space" do
  scenario "adding a new space" do
    visit ('/addnewspace')
    fill_in('name', with: 'Makers')
    fill_in('description', with: 'great')
    fill_in('price', with: '$20')
    click_button("submit")
    expect(page).to have_content('Makers')
    expect(page).to have_content('great')
    expect(page).to have_content('$20')
    expect(current_path).to eq('/new_space')
  end
end







# feature 'Posting a message' do
#   scenario 'user can post a new message which is then displayed' do
#     visit('/messages/new')
#     fill_in('message', with: 'chitter')
#     click_button('add')
#     expect(current_path).to eq('/messages/new')
#     expect(page).to have_content('what is on your mind?......')
#   end