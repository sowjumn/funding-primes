require 'spec_helper'
require_relative '../decorator'

describe Decorator do
  let(:dec) { Decorator.new }
  describe "#print_row" do
    context "when the row is a first one" do 
      it "should print a line separator and an empty box at the beginning of the row and a box for each element in the array" do
        dec.should_receive(:print_line_separator).exactly(1).times
        dec.should_receive(:print_box).exactly(3).times
        dec.print_row([1,2],true)
      end
    end

    context "when the row is not the first one" do
      it "should print a line separator and a box for each element in the array" do
        dec.should_receive(:print_line_separator).exactly(1).times
        dec.should_receive(:print_box).exactly(2).times
        dec.print_row([4,5])
      end
    end
  end

  describe '#print_box' do
    context "when no parameter is passed" do
      it "should print an empty box" do
        i_str = "|" + " "*10
        dec.should_receive(:print).with(i_str)
        dec.print_box
      end
    end

    context "when a parameter is passed" do
      it "should print a box with digits aligned correctly" do
        i_str = "|  " + "453" + " "*5
        dec.should_receive(:print).with(i_str)
        dec.print_box(453)
      end
    end
  end 

  describe '#print_line_separator' do
    let(:length) { 11 }

    it "should print the line separator" do
      i_str = "-"*length*11
      dec.should_receive(:puts).with(i_str)
      dec.print_line_separator
    end
  end
end