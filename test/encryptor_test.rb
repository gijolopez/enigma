require './lib/offset'
require './lib/key_generator'
require './lib/encryptor'
require 'minitest/autorun'
require 'minitest/pride'

# Tests Encryptor class.
class EncryptorTest < Minitest::Test
  def test_it_exist
    encryptor = Encryptor.new('Hello', '00000', '070218')

    assert_instance_of Encryptor, encryptor
  end

  def test_message_argument
    encryptor = Encryptor.new('Hello', '00000', '070218')

    assert_equal 'Hello', encryptor.message
  end

  def test_split_message_into_character_array
    encryptor = Encryptor.new('Hello', '00000', '070218')

    assert_equal %w[h e l l o], encryptor.split_chars
  end

  def test_group_chars_in_fours
    encryptor = Encryptor.new('The boy laughs', '00000', '070218')
    encryptor.split_chars

    expected = [['t', 'h', 'e', ' '],
                ['b', 'o', 'y', ' '],
                ['l', 'a', 'u', 'g'],
                ['h', 's']]

    assert_equal expected, encryptor.groups_of_four
  end

  def test_that_alphabet_can_be_rotated_forward
    encryptor = Encryptor.new('message', '00000', '070218')

    expected = ['f', 'g', 'h', 'i', 'j', 'k', 'l',
                'm', 'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w',
                'x', 'y', 'z', '0', '1', '2', '3',
                '4', '5', '6', '7', '8', '9', ' ',
                '.', ',', 'a', 'b', 'c', 'd', 'e']
    actual = encryptor.rotate_alphabet_by_b

    assert_equal expected, actual
  end

  def test_that_hash_can_be_created
    encryptor = Encryptor.new('message', '00000', '070218')

    expected =
    actual = encryptor.hash_c

    assert_equal expected, actual
  end

  def test_for_encrypt_method
    encryptor = Encryptor.new('messagemessage', '00000', '070218')

    expected = 'tjuwhlgqlxuenj'
    actual = encryptor.encrypt

    assert_equal expected, actual
  end
end
