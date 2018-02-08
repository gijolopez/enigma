class Crack
    attr_reader :encrypted_message,
                :date
  def initialize(encrypted_message,
                 date = Date.today.strftime('%d%m%y'))

    @encrypted_message = encrypted_message
    @date              = date
  end
end
