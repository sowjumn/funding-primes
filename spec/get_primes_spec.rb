require "spec_helper"
require_relative '../get_primes'

describe GetPrimes do   
  context "when no number is passed" do
    let(:get_primes) { GetPrimes.new }
    describe '#perform' do
      it "should return the first 10 prime numbers" do
        get_primes.perform.should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      end
    end
  end

  context "when a number that represents the number of prime numbers to get is passed" do
    let(:get_primes) { GetPrimes.new(20) }
    describe '#perform' do
      it "should return the first 20 prime numbers" do
        get_primes.perform.should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]
      end
    end
  end
end