require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

# Tests for random encryption key generator.
class KeyGeneratorTest < Minitest::Test
  def test_that_key_generator_class_exists
    key_generator = KeyGenerator.new

    assert_instance_of KeyGenerator, key_generator
  end

  def test_that_key_generated_is_a_string
    key_generator = KeyGenerator.new

    assert_instance_of String, key_generator.new_key
  end

  def test_that_key_generated_is_five_digits
    key_generator = KeyGenerator.new

    assert_equal 5, key_generator.new_key.length
  end
end
