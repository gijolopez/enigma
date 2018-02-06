require './lib/offset'
require './lib/key_generator'
require './lib/encryptor'
require 'minitest/autorun'
require 'minitest/pride'

class EncryptorTest < Minitest::Test

  def test_it_exist
    encryptor = Encryptor.new('Hello', '11111')

    assert_instance_of Encryptor, encryptor
  end

  def test_message_argument
    encryptor = Encryptor.new('Hello', '11111')

    assert_equal 'Hello', encryptor.message
  end

  def test_split_message_into_character_array
    encryptor = Encryptor.new('Hello', '11111')

    assert_equal ['h', 'e', 'l', 'l', 'o'], encryptor.split_chars
  end

  def test_group_chars_in_groups_of_four
    encryptor = Encryptor.new('The boy is crossing the street', '11111')
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
    encryptor = Encryptor.new("t", '11111')
    encryptor.split_chars

    assert_equal 19, encryptor.index_position
  end

  def test_that_alphabet_can_be_rotated_forward
    encryptor = Encryptor.new("message", '11111')

    expected = ["q", "r", "s", "t", "u", "v", "w", "x",
                "y", "z", "0", "1", "2", "3", "4",
                "5", "6", "7", "8", "9", " ", ".",
                ",", "a", "b", "c", "d", "e", "f",
                "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p"]
    actual = encryptor.rotate_alphabet_by_b

    assert_equal expected, actual
  end


end
