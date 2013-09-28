require_relative 'luhn'
require 'csv'

class CreditCardValidator < Luhn
  
  attr_reader :length
  
  def initialize card
    card = card.gsub(/\s/, '')
    @length = card.length
    super
  end

  def type
    case card
    when /^(34|37)/
      return 'AMEX' if [15].include? length
    when /^6011/
      return 'Discover' if [16].include? length
    when /^(51|52|53|54|55)/
      return 'MasterCard' if [16].include? length
    when /^4/
      return 'VISA' if [13,16].include? length
    else
      'Unknown'
    end
  end
  
  def line_output
    ["#{type}:", card].join(' ').ljust(30) + "#{valid? ? '(valid)' : '(invalid)'}"
  end
  
end

CSV.foreach('spec/fixtures/credit_cards.csv') do |row|
  card = CreditCardValidator.new row[0]
  puts card.line_output
end