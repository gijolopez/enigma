require_relative 'offset'
require 'pry'

# Encryptor class implementation code.
class Encryptor
  attr_reader :message
  def initialize(message)
    @message = message
    @offset = Offset.new('00000')
  end

  def split_chars
    @message.downcase.chars
  end

  def groups_of_four
    sub_strings = []
    split_chars.each_slice(4) { |letter| sub_strings << letter }
    sub_strings
  end

  def alphabet
    ['a', 'b', 'c', 'd', 'e', 'f',
     'g', 'h', 'i', 'j', 'k', 'l',
     'm', 'n', 'o', 'p', 'q', 'r',
     's', 't', 'u', 'v', 'w', 'x',
     'y', 'z', '0', '1', '2', '3',
     '4', '5', '6', '7', '8', '9',
     ' ', '.', ',']
  end

  def rotate_alphabet_by_b
    alphabet_b = alphabet
    @offset.b_rotation.times do
      alphabet_b.push(alphabet_b.shift)
    end
    alphabet_b
  end

  def rotate_alphabet_by_c
    alphabet_c = alphabet
    @offset.c_rotation.times do
      alphabet_c.push(alphabet_c.shift)
    end
    alphabet_c
  end

  def rotate_alphabet_by_d
    alphabet_d = alphabet
    @offset.d_rotation.times do
      alphabet_d.push(alphabet_d.shift)
    end
    alphabet_d
  end

  def rotate_alphabet_by_a
    alphabet_a = alphabet
    @offset.a_rotation.times do
      alphabet_a.push(alphabet_a.shift)
    end
    alphabet_a
  end

  def hash_a
    Hash[alphabet.zip(rotate_alphabet_by_a)]
  end

  def hash_b
    Hash[alphabet.zip(rotate_alphabet_by_b)]
  end

  def hash_c
    Hash[alphabet.zip(rotate_alphabet_by_c)]
  end

  def hash_d
    Hash[alphabet.zip(rotate_alphabet_by_d)]
  end

  def convert_substring
    substring_a = hash_a[split_chars[0]]
    substring_b = hash_b[split_chars[1]]
    substring_c = hash_c[split_chars[2]]
    substring_d = hash_d[split_chars[3]]
    "#{substring_a}#{substring_b}#{substring_c}#{substring_d}"
  end

end

encryptor = Encryptor.new("hell")
print encryptor.hash_a
