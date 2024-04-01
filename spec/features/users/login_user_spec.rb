require "rails_helper"

RSpec.describe "User login", type: :feature do
  let!(:user) { User.create(name: 'Sam', email: 'sam@test.com', password: 'password123', password_confirmation: 'password123') }

  describe "when visiting the login page" do
    it "displays the login form" do
      visit login_path

      expect(page).to have_content("Log In")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
    end

    it "logs in the user with correct information" do
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password123"
      click_button "Log In"

      expect(current_path).to eq(user_path(user))
    end

    it "does not log in the user with incorrect credentials" do
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password321"
      click_button "Log In"

      expect(page).to have_content("Invalid email or password.")
      expect(current_path).to eq(login_path)
    end
  end
end
