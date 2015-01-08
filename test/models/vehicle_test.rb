require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  
  def setup
    @vehicle = Vehicle.new(make: "Honda", model: "CRF250R", year: 2015, category: "Dirtbike")
  end
  
  
  test "should be valid" do
    assert @vehicle.valid?
  end
  
  test "make should be present" do
    @vehicle.make = nil
    assert_not @vehicle.valid?
  end
  
  test "model should be present" do
    @vehicle.model = nil
    assert_not @vehicle.valid?
  end
  
  test "year should be present" do
    @vehicle.year = nil
    assert_not @vehicle.valid?
  end
  
  test "category should be present" do
    @vehicle.category = nil
    assert_not @vehicle.valid?
  end
  
  
  test "Year should be between 1900-(Today.year+1)" do
    @vehicle.year = 2006
    assert @vehicle.valid?
    @vehicle.year = 1890
    assert_not @vehicle.valid?
    @vehicle.year = Date.today.year+2
    assert_not @vehicle.valid?
    @vehicle.year = Date.today.year+1
    assert @vehicle.valid?
  end
end
