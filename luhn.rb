class Luhn
  attr_reader :card   # [String] Card number. Eg: '4111111111111'
  attr_reader :digits # [String] Checksum
 
  def initialize card
    @card   = card
    @digits = luhn_digits
  end
 
  def valid?
    digits.split('').inject(0) do |sum, digit|
      sum + digit.to_i
    end % 10 == 0
  end
 
private
 
  def luhn_digits
    digits = ''
    card.reverse.chars.each_with_index do |digit,index|
      digits += digit if index % 2 == 0
      digits += (digit.to_i * 2).to_s if index % 2 == 1
    end
    digits
  end
end