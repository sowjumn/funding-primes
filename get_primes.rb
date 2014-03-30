class GetPrimes
  attr_reader :num_primes

  def initialize(num_primes=10)
    @num_primes = num_primes
  end

  def perform
    final_array = [2,3]
    @num_primes = @num_primes - 2
    test_number = 4

    while num_primes != 0
      if is_prime?(test_number)
        final_array.push(test_number)
        @num_primes = @num_primes - 1
      end
      test_number = test_number + 1
    end
    
    final_array
  end

  def is_prime?(n)
    upper_limit = Math.sqrt(n)
    2.upto(upper_limit) do |t|
      return false if n%t == 0
    end
    true
  end
end