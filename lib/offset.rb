require 'Date'
require_relative 'key_generator'

# Calculates the total rotations given a key and a date.
class Offset
  attr_reader :date, :key

  def initialize(key = KeyGenerator.new.new_key,
                 date = Date.today.strftime('%d%m%y'))
    @key = key
    @date = date
  end

  def squared_date
    (date.to_i**2).to_s
  end

  def last_four_digits
    squared_date[-4..-1]
  end

  def a_rotation
    @key[0..1].to_i + squared_date[-4].to_i
  end

  def b_rotation
    @key[1..2].to_i + squared_date[-3].to_i
  end

  def c_rotation
    @key[2..3].to_i + squared_date[-2].to_i
  end

  def d_rotation
    @key[3..4].to_i + squared_date[-1].to_i
  end
end
