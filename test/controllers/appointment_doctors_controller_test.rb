require "test_helper"

class AppointmentDoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointment_doctors_index_url
    assert_response :success
  end

  test "should get new" do
    get appointment_doctors_new_url
    assert_response :success
  end

  test "should get create" do
    get appointment_doctors_create_url
    assert_response :success
  end
end
