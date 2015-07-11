require 'spec_helper'

describe "caesar_cipher" do

  let(:only_string) {'what'}
  let(:complex_string) {'What a sTring!'}

  it 'correctly translates a letter by a given key' do
    expect(caesar_cipher('a', 3)).to eq 'd'
  end

  it 'correctly goes from z back to a when translating' do
    expect(caesar_cipher('z', 1)).to eq 'a'
  end

  it 'correctly translates a complete string by a given key' do 
    expect(caesar_cipher(only_string, 5)).to eq 'bmfy'
  end

  it 'translations preserve capitalization and punctuation' do
    expect(caesar_cipher(complex_string, 5)).to eq 'Bmfy f xYwnsl!'
  end
end