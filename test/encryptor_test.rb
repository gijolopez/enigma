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

  def test_group_chars_in_groups_of_four
    encryptor = Encryptor.new('The boy is crossing the street')
    encryptor.split_chars

    expected = [["t", "h", "e", " "],
                 ["b", "o", "y", " "],
                 ["i", "s", " ", "c"],
                 ["r", "o", "s", "s"],
                 ["i", "n", "g", " "],
                 ["t", "h", "e", " "],
                 ["s", "t", "r", "e"],
                 ["e", "t"]]

    assert_equal expected, encryptor.groups_of_four
  end

  def test_if_letter_can_be_found_in_alphabet
    encryptor = Encryptor.new("t")
    encryptor.split_chars

    assert_equal 19, encryptor.index_position
  end
end
