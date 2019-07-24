require './lib/vendor'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class VendorTest < Minitest::Test

  def setup
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
  end

  def test_exists
    assert_instance_of Vendor, @vendor_1
  end

  def test_attributes
    expected ={}
    assert_equal "Rocky Mountain Fresh", @vendor_1.name
    assert_equal expected, @vendor_1.inventory
  end

  def test_check_stock
    assert_equal 0, @vendor_1.check_stock("Peaches")
  end

  def test_stock_aggregate
    @vendor_1.stock("Peaches", 30)
    assert_equal 30, @vendor_1.check_stock("Peaches")
  end

  def test_stock_multiple_same
    @vendor_1.stock("Peaches", 30)
    @vendor_1.stock("Peaches", 25)
    assert_equal 55, @vendor_1.check_stock("Peaches")
  end

  def test_stock_multiple_unique
    @vendor_1.stock("Peaches", 30)
    @vendor_1.stock("Peaches", 25)
    @vendor_1.stock("Tomatoes", 12)
    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, @vendor_1.inventory
  end
end
