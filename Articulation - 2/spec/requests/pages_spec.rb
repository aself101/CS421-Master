gem 'minitest'
require 'minitest/autorun'

describe "Pages" do

  describe "Home page" do

    it "should have the content 'University of Hawaii at Hilo'" do
      visit '/pages/home'
      expect(page).to have_content('University of Hawaii at Hilo')
    end
    it "should have the title 'Home'" do
      visit '/pages/home'
      expect(page).to have_title("University of Hawaii at Hilo | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'University of Hawaii t Hilo Help Page'" do
      visit '/pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("University of Hawaii t Hilo | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About University of Hawaii at Hilo Articulation'" do
      visit '/pages/about'
      expect(page).to have_content('About Articulation')
    end
    it "should have the title 'About'" do
      visit '/pages/about'
      expect(page).to have_title("University of Hawaii at Hilo | About")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/pages/contact'
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit '/pages/contact'
      expect(page).to have_title("University of Hawaii at Hilo | Contact")
    end
  end

end




