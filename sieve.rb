# Finding the primes from 2 to given number using Sieve of Eratosthenes algorithm
class Sieve
  attr_reader :list
  
  def initialize(number)
    @list = (2..number).to_a
  end
  
  def primes
    all_primes = []
    loop do
      all_primes << list.shift
      list.delete_if { |val| val % (all_primes.last) == 0 }
      break if list.empty?
    end
    all_primes
  end
  
end





