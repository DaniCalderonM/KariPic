require "application_system_test_case"

class KppostsTest < ApplicationSystemTestCase
  setup do
    @kppost = kpposts(:one)
  end

  test "visiting the index" do
    visit kpposts_url
    assert_selector "h1", text: "Kpposts"
  end

  test "should create kppost" do
    visit kpposts_url
    click_on "New kppost"

    fill_in "Description", with: @kppost.description
    fill_in "Kpuser", with: @kppost.kpuser_id
    click_on "Create Kppost"

    assert_text "Kppost was successfully created"
    click_on "Back"
  end

  test "should update Kppost" do
    visit kppost_url(@kppost)
    click_on "Edit this kppost", match: :first

    fill_in "Description", with: @kppost.description
    fill_in "Kpuser", with: @kppost.kpuser_id
    click_on "Update Kppost"

    assert_text "Kppost was successfully updated"
    click_on "Back"
  end

  test "should destroy Kppost" do
    visit kppost_url(@kppost)
    click_on "Destroy this kppost", match: :first

    assert_text "Kppost was successfully destroyed"
  end
end
