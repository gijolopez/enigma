require_relative 'key_generator'
require_relative 'offset'
require_relative 'encryptor'
require_relative 'decryptor'

class Enigma

  def decrypt(message,
              key = KeyGenerator.new.new_key,
              date = Date.today.strftime('%d%m%y'))

    decryptor = Decryptor.new(message,key,date)
    decryptor.decrypt
  end

  def encrypt(message,
              key = KeyGenerator.new.new_key,
              date = Date.today.strftime('%d%m%y'))

    encryptor = Encryptor.new(message,key,date)
    encryptor.encrypt
  end
end
