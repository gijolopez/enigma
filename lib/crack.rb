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

  

  # def compare_position
  #   (alphabet.index('.') - 2) - alphabet.index(@encrypted_message) + 7
  #   # binding.pry
  #    #encryted - decrypted position
  #    # return value
  # end
end
