require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:janik)
    @vehicle = @user.vehicles.build(make: "Honda",model: "CRF250R", year: "2015", name: "BRP", category: "dirtbike", unit_of_measurement: "hours")
  end

  test "should be valid" do
    assert @vehicle.valid?
  end

  test "user id should be present" do
    @vehicle.user_id = nil
    assert_not @vehicle.valid?
  end
  
  test "Vehicle info should be present " do
    @vehicle.name = "   "
    @vehicle.make = "   "
    @vehicle.model = "   "
    assert_not @vehicle.valid?
  end
  
  test "Vehicle year should be an integer" do
    @vehicle.year = "false"
    assert_not @vehicle.valid?
    @vehicle.year = "1999"
    assert @vehicle.valid?
  end
  
end
