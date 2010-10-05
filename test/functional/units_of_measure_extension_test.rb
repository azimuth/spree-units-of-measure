require File.dirname(__FILE__) + '/../test_helper'

class UnitsOfMeasureExtensionTest < Test::Unit::TestCase
  
  # Replace this with your real tests.
  def test_this_extension
    flunk
  end
  
  def test_initialization
    assert_equal File.join(File.expand_path(Rails.root), 'vendor', 'extensions', 'units_of_measure'), UnitsOfMeasureExtension.root
    assert_equal 'Units Of Measure', UnitsOfMeasureExtension.extension_name
  end
  
end
