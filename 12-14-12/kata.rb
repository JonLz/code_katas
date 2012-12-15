# sum all the primes up the nth prime number 
# no using Ruby's prime class!

def prime(nth_prime)
  n = 0
  prime = 1
  primes = []
  while( n < nth_prime )
    prime += 1
    prime_found = true
    # refactor to use a helper
    (2..( prime-1 ) ).each do |num|
      prime_found = false if prime % num == 0
      break unless prime_found
    end
    if prime_found
      primes << prime
      n+=1
    end
  end
  primes.reduce(:+)
end

require 'rspec'

describe 'prime' do
	it 'should return the sum of the first 1000 primes' do
	  prime(1000).should eq 3682913
  end
end


# hash traversals
class Hash
	def r_empty?
		empty = true
		self.each do |k,v|
			next if v.nil?
			empty = false unless v.empty?
			empty = v.r_empty? if v.kind_of? Hash
		end
		empty
	end
end

describe 'hash traverser' do
	it 'should traverse and return true if all elements are empty' do
		a = {:ruby => "", :queue => ""}
		b = {:ruby => {:version => {:one => {"nine" => ""}, "two" => "=^.^="}}, :html => ""}
		c = {:pets => {:dogs => {:my => {"niko" => ""}, "ollie" => ""}}, :cats => nil, :mice => ""}
		d = {a: "", b: :two, c: ""}

		a.r_empty?.should be_true
		b.r_empty?.should be_false
		c.r_empty?.should be_true
		d.r_empty?.should be_false
		{}.r_empty?.should be_true
	end
end
