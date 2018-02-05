require './lib/offset'
require './lib/key_generator'
require './lib/encryptor'
require 'minitest/autorun'
require 'minitest/pride'

class EncryptorTest < Minitest::Test

  def test_it_exist
    encryptor = Encryptor.new('Hello')

    assert_instance_of Encryptor, encryptor
  end

  def test_message_argument
    encryptor = Encryptor.new('Hello')

    assert_equal 'Hello', encryptor.message
  end

  def test_split_message_into_character_array
    encryptor = Encryptor.new('Hello')

    assert_equal ['h', 'e', 'l', 'l', 'o'], encryptor.split_chars
  end
end
