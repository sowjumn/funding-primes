require 'spec_helper'
require_relative '../print_table'

describe PrintTable do
  let(:decorator) { double('decorator') }
  let(:get_primes) { double('get_primes') }
  let(:print_table) { PrintTable.new(2) }

  before :each do 
    Decorator.should_receive(:new).and_return(decorator)
    GetPrimes.should_receive(:new).and_return(get_primes)
    get_primes.should_receive(:perform).and_return([2,3])
  end

  describe "#perform" do
    it "should print the table" do
      print_table.should_receive(:print_first_row).and_return(double())
      print_table.should_receive(:print_rest_rows).and_return(double())
      print_table.perform
    end
  end

  describe "#print_first_row" do
    it "should print the first row" do
      decorator.should_receive(:print_row).with([2,3],true)
      print_table.print_first_row
    end
  end

  describe "#print_rest_rows" do
    it "should print the rest of the rows" do
      decorator.should_receive(:print_row).exactly(2).times
      decorator.should_receive(:print_line_separator)
      print_table.should_receive(:generate_mult_row).exactly(2).times
      print_table.print_rest_rows
    end
  end

  describe "#generate_mult_row" do
    it "should return an array of multiplication values with the first value being the value multiplied with the primes" do
      print_table.generate_mult_row(2).should == [2,4,6]
    end
  end
end