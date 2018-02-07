require_relative 'key_generator'
require_relative 'offset'
require_relative 'encryptor'
require_relative 'decryptor'

class Enigma

  def decrypt(message,key)
    decryptor = Decryptor.new(message,key)
    decryptor.decrypt
  end





end
