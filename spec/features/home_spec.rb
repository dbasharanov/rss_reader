describe "the feed adding process", type: :feature do
  
  it "add feed" do
    visit 'http://localhost:3000/feeds/'
    within("form") do
      fill_in 'Url', with: 'https://www.investor.bg/bulletin/rss/'
    end
    click_button 'ADD'
    expect(page).to have_content 'Success'
  end
end