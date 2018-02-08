require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require './lib/offset'
require './lib/encryptor'
require './lib/decryptor'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_does_it_exisit
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_can_enigma_decrypt
    enigma = Enigma.new

    assert_equal 'hell' , enigma.decrypt('ojnp','00000')
  end

  def test_can_enigma_encrypt
    enigma = Enigma.new

    assert_equal 'ojnp' , enigma.encrypt('hell','00000')
  end

end
