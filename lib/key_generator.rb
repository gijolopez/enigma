# Generates a random encryption key.
class KeyGenerator
  def new_key
    key = []
    5.times do
      key << rand(0..9)
    end
    key.join
  end
end
