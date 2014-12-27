require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  
  def setup
    @vehicle = vehicles(:yamaha)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Vehicle.count' do
      post :create, vehiclet: { make: "Honda", model: "CRF250R", year: 2014, name: "Something" }
    end
    assert_redirected_to login_url
  end
  
end
