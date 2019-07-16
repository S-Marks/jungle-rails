require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 1,
        price: 64.99
      )
  end

  scenario "They see the product they clicked on" do
    # ACT
    visit root_path
    click_on 'Details'

    # DEBUG
    save_screenshot "product.png"

    # VERIFY
    expect(page).to have_css 'article.product', count: 1
  end
end
