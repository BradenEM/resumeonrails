require "application_system_test_case"

class ResumesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)

    visit new_session_url

    fill_in "email_address", with: @user.email_address
    fill_in "password", with: "password"

    click_on "Sign in"

    @resume = resumes(:one)

    assert_text "Resumes"
  end

  test "visiting the dashboard" do
    visit root_path
    assert_selector "h1", text: "Resumes"
  end

  test "should create resume" do
    visit root_path
    click_on "Create New Resume"

    fill_in "resume_title", with: @resume.title
    fill_in "resume_email", with: @resume.email
    fill_in "resume_name", with: @resume.name
    fill_in "resume_phone", with: @resume.phone
    fill_in "resume_summary", with: @resume.summary
    click_on "Create Resume"

    assert_text "Resume was successfully created."
    click_on "Back"
  end

  test "should update Resume" do
    visit resume_editor_resume_path(@resume)

    fill_in "resume_title", with: @resume.title
    fill_in "resume_email", with: @resume.email
    fill_in "resume_name", with: @resume.name
    fill_in "resume_phone", with: @resume.phone
    fill_in "resume_summary", with: @resume.summary

    # TODO Need to assert the changes
  end

  test "should destroy Resume" do
    visit resume_path(@resume)
    click_on "Delete", match: :first

    assert_text "Resume was successfully destroyed"
  end
end
