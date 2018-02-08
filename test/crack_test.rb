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

  # def test_can_compare_encrypted_and_decrypted_index_position
  #   crack = Crack.new(',9bhr0bxw08', '070218')
  #
  #   assert_equal 18, crack.compare_position
  # end

  def test_remainder_in_encrypted_message
    crack = Crack.new(',9bhr0bxw08', '070218')

    assert_equal 
  end
end
