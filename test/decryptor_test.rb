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
    skip
    encryptor = Encryptor.new('kidfnyhio')

    expected = ['h', 'i', 'j', 'k', 'l', 'm',
                'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w', 'x', 'y',
                'z', '0', '1', '2', '3', '4',
                '5', '6', '7', '8', '9', ' ',
                '.', ',', 'a', 'b', 'c', 'd',
                'e', 'f', 'g']
    actual = encryptor.hash_a

    assert_equal expected, actual
  end

  def test_for_decrypt_method
    decryptor = Decryptor.new('tjuwhlgqlxuenj')

    expected = 'messagemessage'
    actual = decryptor.decrypt

    assert_equal expected, actual
  end
end
