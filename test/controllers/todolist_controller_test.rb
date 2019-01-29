require 'test_helper'

class TodolistControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get todolist_create_url
    assert_response :success
  end

end
