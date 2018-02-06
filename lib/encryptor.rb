require_relative 'offset'

class Encryptor
  attr_reader :message
  def initialize(message)
    @message = message
    @offset = Offset.new('54345')
    @alphabet =["a", "b", "c", "d", "e", "f", "g",
                "h", "i", "j", "k", "l", "m", "n",
                "o", "p", "q", "r", "s", "t", "u",
                "v", "w", "x", "y", "z", "0", "1",
                "2", "3", "4", "5", "6", "7", "8",
                "9", " ", ".", ","]
  end

  def split_chars
    @message.downcase.chars
  end

  def groups_of_four
    sub_strings = []
    split_chars.each_slice(4){|letter| sub_strings << letter}
    sub_strings
  end

  def index_position
    @alphabet.index(groups_of_four[0][0])
  end

  def reset_index_position
    index_position - index_position
  end

  def new_index_position
    reset_index_position + @offset.a_rotation
  end

  def new_index_character
    encrypted_message = []
    if (index_position + @offset.a_rotation) <= 39
      encrypted_message << @alphabet[(index_position + @offset.a_rotation)]
    elsif (index_position + @offset.a_rotation) >= 39 && (index_position + @offset.a_rotation) <= 78
      encrypted_message << @alphabet[(index_position + @offset.a_rotation - 40)]
    elsif (index_position + @offset.a_rotation) >= 78
       encrypted_message << @alphabet[(index_position + @offset.a_rotation - 40 - 40)]
    end
    encrypted_message
  end
end
