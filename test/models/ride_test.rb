require 'test_helper'

class RideTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:janik)
    @ride = @user.rides.build(make: "Honda",model: "CRF250R", year: "2015", name: "BRP", category: "dirtbike", unit_of_measurement: "hours")
  end

  test "should be valid" do
    assert @ride.valid?
  end

  test "user id should be present" do
    @ride.user_id = nil
    assert_not @ride.valid?
  end
  
  test "ride info should be present " do
    @ride.name = "   "
    @ride.make = "   "
    @ride.model = "   "
    assert_not @ride.valid?
  end
  
  test "ride year should be an integer" do
    @ride.year = "false"
    assert_not @ride.valid?
    @ride.year = "1999"
    assert @ride.valid?
  end
  
  test "Year should be between 1900-(Today.year+1)" do
    @ride.year = 2006
    assert @ride.valid?
    @ride.year = 1890
    assert_not @ride.valid?
    @ride.year = Date.today.year+2
    assert_not @ride.valid?
    @ride.year = Date.today.year+1
    assert @ride.valid?
  end

  
end
