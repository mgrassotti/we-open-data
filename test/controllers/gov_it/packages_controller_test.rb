require 'test_helper'

class GovIt::PackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gov_it_packages_index_url
    assert_response :success
  end

  test "should get show" do
    get gov_it_packages_show_url
    assert_response :success
  end

end
