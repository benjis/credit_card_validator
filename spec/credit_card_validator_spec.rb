require 'spec_helper'

describe CreditCardValidator do

  it "should strip the whitespaces" do
    ccv = CreditCardValidator.new("5105 1051 0510 5106")
    expect(ccv.card).to eq("5105105105105106")
  end
  
  it "should return the correct length" do
    ccv = CreditCardValidator.new("5105 1051 0510 5106")
    expect(ccv.length).to eq(16)
  end
  
  it "should return the correct card type" do
    expect(CreditCardValidator.new("4111111111111").type).to eq("VISA")
    expect(CreditCardValidator.new("378282246310005").type).to eq("AMEX")
    expect(CreditCardValidator.new("6011111111111117").type).to eq("Discover")
    expect(CreditCardValidator.new("5105105105105100").type).to eq("MasterCard")
    expect(CreditCardValidator.new("9111111111111111").type).to eq("Unknown")
  end
  
  it "should print the correct output" do
    expect(CreditCardValidator.new("4012888888881881").line_output).to eq("VISA: 4012888888881881 (valid)")
    expect(CreditCardValidator.new("9111111111111111").line_output).to eq("Unknown: 9111111111111111 (invalid)")
  end
  
end