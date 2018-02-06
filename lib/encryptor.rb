require_relative 'offset'

# Encryptor class implementation code.
class Encryptor
  attr_reader :message
  def initialize(message, key)
    @message = message
    @offset = Offset.new(key)
    @alphabet = ['a', 'b', 'c', 'd', 'e', 'f',
                 'g', 'h', 'i', 'j', 'k', 'l',
                 'm', 'n', 'o', 'p', 'q', 'r',
                 's', 't', 'u', 'v', 'w', 'x',
                 'y', 'z', '0', '1', '2', '3',
                 '4', '5', '6', '7', '8', '9',
                 ' ', '.', ',']
  end

  def split_chars
    @message.downcase.chars
  end

  def groups_of_four
    sub_strings = []
    split_chars.each_slice(4) { |letter| sub_strings << letter }
    sub_strings
  end

  def index_position
    @alphabet.index(groups_of_four[0][0])
  end

  def rotate_alphabet_by_a
    alphabet_a = ['a', 'b', 'c', 'd', 'e', 'f',
                  'g', 'h', 'i', 'j', 'k', 'l',
                  'm', 'n', 'o', 'p', 'q', 'r',
                  's', 't', 'u', 'v', 'w', 'x',
                  'y', 'z', '0', '1', '2', '3',
                  '4', '5', '6', '7', '8', '9',
                  ' ', '.', ',']
    @offset.a_rotation.times do
      alphabet_a.push(alphabet_a.shift)
    end
    alphabet_a
  end

  def rotate_alphabet_by_b
    alphabet_b = ['a', 'b', 'c', 'd', 'e', 'f',
                  'g', 'h', 'i', 'j', 'k', 'l',
                  'm', 'n', 'o', 'p', 'q', 'r',
                  's', 't', 'u', 'v', 'w', 'x',
                  'y', 'z', '0', '1', '2', '3',
                  '4', '5', '6', '7', '8', '9',
                  ' ', '.', ',']
    @offset.a_rotation.times do
      alphabet_b.push(alphabet_b.shift)
    end
    alphabet_b
  end
end
