class Encryptor
  attr_reader :message
  def initialize(message)
    @message = message
  end

  def split_chars
    @message.downcase.chars
  end


end
