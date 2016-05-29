require 'rails_helper'

RSpec.feature "user sees all songs" do
  scenario "user visits songs index page to see all songs" do
    visit songs_path
  end
end
