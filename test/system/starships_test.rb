require "application_system_test_case"

class StarshipsTest < ApplicationSystemTestCase
  setup do
    @starship = starships(:one)
  end

  test "visiting the index" do
    visit starships_url
    assert_selector "h1", text: "Starships"
  end

  test "creating a Starship" do
    visit starships_url
    click_on "New Starship"

    fill_in "Name", with: @starship.name
    click_on "Create Starship"

    assert_text "Starship was successfully created"
    click_on "Back"
  end

  test "updating a Starship" do
    visit starships_url
    click_on "Edit", match: :first

    fill_in "Name", with: @starship.name
    click_on "Update Starship"

    assert_text "Starship was successfully updated"
    click_on "Back"
  end

  test "destroying a Starship" do
    visit starships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Starship was successfully destroyed"
  end
end
