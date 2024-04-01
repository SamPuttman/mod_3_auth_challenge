require "rails_helper"

RSpec.describe "User create", type: :feature do

  describe "when visiting the create page" do
    it "displays the create form" do
      visit register_path

      expect(page).to have_content("Name")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Confirm Password")
    end
