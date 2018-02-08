require 'minitest/pride'
require 'minitest/autorun'
require './lib/offset'

# Tests for rotation offset calculator.
class OffsetTest < Minitest::Test
  def test_if_exists
    offset = Offset.new('00000', '070218')

    assert_instance_of Offset, offset
  end

  def test_date_squared
    offset = Offset.new('00000', '070218')

    assert_equal '4930567524', offset.squared_date
  end

  def test_last_four_digits
    offset = Offset.new('00000', '070218')
    offset.squared_date

    assert_equal offset.squared_date[-4..-1], offset.last_four_digits
  end

  def test_a_total_rotation
    offset = Offset.new('00000', '070218')

    assert_equal 7, offset.a_rotation
  end

  def test_b_total_rotation
    offset = Offset.new('00000', '070218')
    offset.squared_date

    assert_equal 5, offset.b_rotation
  end

  def test_c_total_rotation
    offset = Offset.new('00000', '070218')
    offset.squared_date

    assert_equal 2, offset.c_rotation
  end

  def test_d_total_rotation
    offset = Offset.new('00000', '070218')
    offset.squared_date

    assert_equal 4, offset.d_rotation
  end
end
