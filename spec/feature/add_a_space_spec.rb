feature "user can add a new space" do
  scenario "adding a new space" do
    visit('/addnewspace')
    fill_in("name", with: "Makers")
    fill_in('description', with: 'great')
    fill_in('price', with: '$20')
    click_button('Submit')
    expect(page).to have_content('Makers')
    expect(page).to have_content('great')
    expect(page).to have_content('$20')
    expect(current_path).to eq('/spaces')
  end
end



