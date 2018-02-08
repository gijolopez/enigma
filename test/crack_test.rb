require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require './lib/offset'
require './lib/encryptor'
require './lib/decryptor'
require './lib/enigma'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_does_it_exisit
    crack = Crack.new('ksadfkcdfkdls', '070218')

    assert_instance_of Crack, crack
  end

  def test_it_can_pass_encrypted_message
    crack = Crack.new('ksadfkcdfkdls', '070218')

    assert_equal 'ksadfkcdfkdls', crack.encrypted_message
    assert_equal '070218', crack.date
  end

  def test_can_calculate_total_rotation_array
    crack = Crack.new('hr0bxw08', '070218')

    assert_equal [-10, -19, 11, 3], crack.calculate_0_mod_rotation
    assert_equal [3, -10, -19, 11], crack.calculate_1_mod_rotation
    assert_equal [11, 3, -10, -19], crack.calculate_2_mod_rotation
    assert_equal [20, 11, 3, -10],  crack.calculate_3_mod_rotation
  end

  # def test_remainder_in_encrypted_message
  #   crack = Crack.new(',9bhr0bxw08', '070218')
  #
  #   assert_equal
  # end
end
