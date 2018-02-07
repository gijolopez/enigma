require './lib/offset'
require './lib/key_generator'
require './lib/encryptor'
require './lib/decryptor'
require 'minitest/autorun'
require 'minitest/pride'

# Tests Encryptor class.
class DecryptorTest < Minitest::Test
  def test_decryptor_class_exists
    decryptor = Decryptor.new('hello')

    assert_instance_of Decryptor, decryptor
  end

  def test_message_argument
    decryptor = Decryptor.new('kidfn')

    assert_equal 'kidfn', decryptor.message
  end

  def test_split_message_into_character_array
    decryptor = Decryptor.new('kidfn')

    assert_equal %w[k i d f n], decryptor.split_chars
  end

  def test_group_chars_in_fours
    decryptor = Decryptor.new('kidfnyhio')
    decryptor.split_chars

    expected = [['k', 'i', 'd', 'f'],
                ['n', 'y', 'h', 'i'],
                ['o']]

    assert_equal expected, decryptor.groups_of_four
  end

  def test_that_alphabet_can_be_rotated_forward
    decryptor = Decryptor.new('kidfnyhio')

    expected = ['h', 'i', 'j', 'k', 'l', 'm',
                'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w', 'x', 'y',
                'z', '0', '1', '2', '3', '4',
                '5', '6', '7', '8', '9', ' ',
                '.', ',', 'a', 'b', 'c', 'd',
                'e', 'f', 'g']
    actual = decryptor.rotate_alphabet_by_a

    assert_equal expected, actual
  end

  def test_that_hash_can_be_created_and_inverted
    decryptor = Decryptor.new('kidfnyhio')

    expected = {"h"=>"a", "i"=>"b", "j"=>"c", "k"=>"d",
                "l"=>"e", "m"=>"f", "n"=>"g", "o"=>"h",
                "p"=>"i", "q"=>"j", "r"=>"k", "s"=>"l",
                "t"=>"m", "u"=>"n", "v"=>"o", "w"=>"p",
                "x"=>"q", "y"=>"r", "z"=>"s", "0"=>"t",
                "1"=>"u", "2"=>"v", "3"=>"w", "4"=>"x",
                "5"=>"y", "6"=>"z", "7"=>"0", "8"=>"1",
                "9"=>"2", " "=>"3", "."=>"4", ","=>"5",
                "a"=>"6", "b"=>"7", "c"=>"8", "d"=>"9",
                "e"=>" ", "f"=>".", "g"=>","}
    actual = decryptor.hash_a

    assert_equal expected, actual
  end

  def test_for_decrypt_method
    decryptor = Decryptor.new('tjuwhlgqlxuenj')

    expected = 'messagemessage'
    actual = decryptor.decrypt

    assert_equal expected, actual
  end
end
