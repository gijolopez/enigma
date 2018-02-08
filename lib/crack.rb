require 'pry'
class Crack
    attr_reader :encrypted_message,
                :date
  def initialize(encrypted_message,
                 date = Date.today.strftime('%d%m%y'))

    @encrypted_message = encrypted_message
    @date              = date
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

  def calculate_0_mod_rotation
    last_four_array = @encrypted_message.chars[-4..-1]
    actual_last_four = ["n", "d", ".", "."]
    zipped = last_four_array.zip(actual_last_four)
    zipped.map do |subarray|
      alphabet.index(subarray[1]) - alphabet.index(subarray[0])
    end
  end

  def calculate_1_mod_rotation
    last_four_array = @encrypted_message.chars[-5..-2]
    actual_last_four = ["e", "n", "d", "."]
    zipped = last_four_array.zip(actual_last_four)
    zipped.map do |subarray|
      alphabet.index(subarray[1]) - alphabet.index(subarray[0])
    end
  end

  def calculate_2_mod_rotation
    last_four_array = @encrypted_message.chars[-6..-3]
    actual_last_four = [".", "e", "n", "d"]
    zipped = last_four_array.zip(actual_last_four)
    zipped.map do |subarray|
      alphabet.index(subarray[1]) - alphabet.index(subarray[0])
    end
  end

  def calculate_3_mod_rotation
    last_four_array = @encrypted_message.chars[-7..-4]
    actual_last_four = [".", ".", "e", "n"]
    zipped = last_four_array.zip(actual_last_four)
    zipped.map do |subarray|
      alphabet.index(subarray[1]) - alphabet.index(subarray[0])
    end
  end
end
