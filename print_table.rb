require './get_primes'
require './decorator'

class PrintTable 
  attr_reader :dec, :primes

  def initialize(num_of_primes=nil)
    @dec = Decorator.new(num_of_primes)
    @primes = GetPrimes.new(num_of_primes).perform
  end

  def perform
    print_first_row
    print_rest_rows
  end

  def print_first_row
    dec.print_row(primes,true)
  end

  def print_rest_rows
    primes.each do |p|
      dec.print_row(generate_mult_row(p))
    end
    dec.print_line_separator
  end

  def generate_mult_row(p)
    mult_row = [p]
    primes.each do |q|
      mult_row.push(p*q)
    end
    mult_row
  end
end

p = PrintTable.new(10).perform