require 'spec_helper'

describe "caesar_cipher" do

  let(:only_string) {'what'}
  let(:complex_string) {'What a sTring!'}

  it 'correctly translates a letter by a given key' do
    expect(caesar_cipher('a', 3)).eql?('d')
  end

  it 'correctly goes from z back to a when translating' do
    expect(caesar_cipher('z', 1)).eql?('a')
  end

  it 'correctly translates a complete string by a given key' do 
    expect(caesar_cipher(only_string, 5)).eql?('bmfy')
  end

  it 'translations preserve capitalization and punctuation' do
    expect(caesar_cipher(complex_string, 5)).eql?('Bmfy f xYwnsl!')
  end
end