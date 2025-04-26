require "application_system_test_case"

class ResumesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)

    visit new_session_url

    fill_in "email_address", with: @user.email_address
    fill_in "password", with: "password"

    click_on "Sign in"
    click_on "Dashboard"

    @resume = resumes(:one)
  end

  test "visiting the index" do
    visit resumes_url
    assert_selector "h1", text: "Resumes"
  end

  test "should create resume" do
    visit resumes_path
    click_on "New resume"

    fill_in "Email", with: @resume.email
    fill_in "Name", with: @resume.name
    fill_in "Phone", with: @resume.phone
    fill_in "Summary", with: @resume.summary
    click_on "Create Resume"

    assert_text "Resume was successfully created"
    click_on "Back"
  end

  test "should update Resume" do
    visit edit_resume_path(@resume)

    fill_in "Email", with: @resume.email
    fill_in "Name", with: @resume.name
    fill_in "Phone", with: @resume.phone
    fill_in "Summary", with: @resume.summary
    click_on "Update Resume"

    assert_text "Resume was successfully updated"
    click_on "Back"
  end

  test "should destroy Resume" do
    visit resume_path(@resume)
    click_on "Destroy this resume", match: :first

    assert_text "Resume was successfully destroyed"
  end
end
