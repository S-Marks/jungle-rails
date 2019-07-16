require 'rails_helper'

RSpec.feature "Visitor logs in as user", type: :feature, js: true do

  # SETUP
  before :each do

    @user = User.create!(
      name: 'username',
      email: 'test@test.com',
      password: 'testing',
      password_confirmation: 'testing'
    )

      @category = Category.create! name: 'Apparel'
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "They are able to login" do
    # ACT
    visit root_path
    click_on 'Login'

    within 'form' do
      fill_in id: 'email', with: 'test@test.com'
      fill_in id: 'password', with: 'testing'

      click_button 'SIGN IN'
    end


    # DEBUG
    save_screenshot "login.png"

    # VERIFY
    expect(page).to have_text 'Signed in as username'
  end
end
