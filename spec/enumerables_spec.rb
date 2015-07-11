require 'spec_helper'


describe 'my_enumerables' do

  let(:single_array) {[1]}
  let(:multiple_array) {[1, 2, 'b']}

  describe 'my_each' do 

    before :each do 
      @array = Array.new
    end

    it 'correctly applies a block to a single element' do
      [1].my_each{ |n| @array << n }
      expect(@array).to eq [1]
    end

    it 'correctly applies a block to multiple elements' do 
      multiple_array.my_each{ |n| @array << n }
      expect(@array).to eq [1, 2, 'b']
    end

    it 'returns self as enumerable if no block is passed' do 
      expect(multiple_array.my_each.is_a? Enumerable).to be true
    end
  end

  describe 'my_each_with_index' do

    before :each do 
      @array = Array.new
    end

    it 'correctly applies a block to a single element' do 
      [1].my_each_with_index{ |n, index| @array << index}
      expect(@array).to eq [0]
    end

    it 'correctly applies a block to multiple elements' do 
      multiple_array.my_each_with_index{ |n, index| @array<<index}
      expect(@array).to eq [0, 1, 2]
    end

    it 'returns self as enumerable if no block is passed' do 
      expect(multiple_array.my_each.is_a? Enumerable).to be true
    end
  end

  describe 'my_select' do

    it 'correctly selects a single element' do
      expect(single_array.my_select{ |n| n == 1}).to eq [1]
    end

    it 'correctly does not select a single element' do 
      expect(single_array.my_select{ |n| n != 1}).to eq []
    end

    it 'correctly selects from multiple-element array' do 
      expect(multiple_array.my_select{ |n| n.is_a? Integer}).to eq [1, 2]
    end

    it 'correctly does not select from multiple-element array' do
      expect(multiple_array.my_select{ |n| n.is_a? Enumerable}).to eq []
    end
  end

  describe 'my_all?' do
    it 'correctly returns true given an array and block' do
      expect(multiple_array.my_all?{ |n| !n.is_a? Enumerable}).to be true
    end

    it 'correctly returns false given an array and block' do
      expect(multiple_array.my_all?{ |n| n.is_a? String}).to_not be true
    end
  end

  describe 'my_any?' do
    it 'correctly returns true when any element in an array matches a block' do
      expect(multiple_array.my_any?{ |n| n.is_a? String}).to be true
    end

    it 'correctly returns false when not one element matches an array and block' do
      expect(multiple_array.my_any?{ |n| n.is_a? Enumerable}).to_not be true
    end
  end

  describe 'my_none?' do
    it 'correctly returns true when no elements in array match a block' do
      expect(multiple_array.my_none?{ |n| n.is_a? Enumerable}).to be true
    end

    it 'correctly returns false when at least one element in array matches a block' do
      expect(multiple_array.my_none?{ |n| n == 1}).to be false
    end
  end

  describe 'my_count' do
    it 'correctly returns number of elements matching block' do
      expect(multiple_array.my_count{ |n| n.is_a? Integer }).to eq 2
    end

    it 'correctly returns 0 when no elements match block' do 
      expect(multiple_array.my_count{ |n| n.is_a? Enumerable}).to eq 0
    end
  end

  describe 'my_map' do
    it 'correctly returns modified array of one element' do
      expect(single_array.my_map{ |n| n + 2 }).to eq [3]
    end

    it 'correctly returns modified array of multiple elements' do
      expect(multiple_array.my_map{ |n| n.to_s}).to eq ['1', '2', 'b']
    end
  end

  describe 'my_inject' do 
    it 'correctly accumulates a value for a single element' do
      expect(single_array.my_inject(3){ |result, n| result + n }).to eq 4
    end

    it 'correctly accumulates values for multiple elements' do
      expect([1, 2, 3].my_inject(1){ |result, n| result + n }).to eq 7
    end

    it 'correctly starts value at zero if not given argument' do
      expect(single_array.my_inject{ |result, n| result + n }).to eq 1
    end
  end
end