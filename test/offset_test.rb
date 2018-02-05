require 'minitest/pride'
require 'minitest/autorun'
require './lib/offset'

# Tests for rotation offset calculator.
class OffsetTest < Minitest::Test
  def test_if_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_date_squared
    offset = Offset.new
    offset.date

    assert_equal offset.date**2, offset.squared_date
  end

  def test_last_four_digits
    offset = Offset.new
    offset.squared_date

    assert_equal offset.squared_date[-4..-1], offset.last_four_digits
  end

  def test_a_total_rotation
    offset = Offset.new
    generated_key = offset.key

    expected = offset.last_four_digits[-4].to_i + generated_key[0..1].to_i
    actual = offset.a_rotation

    assert_equal expected, actual
  end

  def test_b_total_rotation
    offset = Offset.new
    offset.squared_date

    assert_equal 4, offset.b_rotation
  end

  def test_c_total_rotation
    offset = Offset.new
    offset.squared_date

    assert_equal 5, offset.c_rotation
  end

  def test_d_total_rotation
    offset = Offset.new
    offset.squared_date

    assert_equal 6, offset.d_rotation
  end
end
