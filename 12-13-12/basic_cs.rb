# Working through some basic trivial Java/C/C++ interview questions for fun!
# ::puts on C++ programmer hat::

# Reverse a string in a functional manner
# Yes I know ruby can just use .reverse :)
def rev(string)
	len = string.length - 1
	i = 0
	str=""
	while(i < len/2)
		str=string[i]
		string[i] = string[len-i]
		string[len-i] = str
		i+=1
	end
	string
end

require 'rspec'
describe 'reverse' do
it 'takes a string and reverses it' do
rev('abc').should eq 'cba'
end
end

# Fibonnaci
def fib(n)
	return n if n<= 1
	fib = [0,1]
	while (n > 1)
		last_fib = fib[-1]
		second_last_fib = fib[-2]
		next_fib = last_fib + second_last_fib
		fib << next_fib
		n -= 1
		puts next_fib
	end
	fib.last
end

# without arrays
def fib_iter(n) 
    curr_num, next_num = 0, 1
    (n).times do
        curr_num, next_num = next_num, curr_num + next_num
    end  
    curr_num
end 

# refactoring, this solution is really inefficient
def fib1(n)
  n <= 1 ? n : fib1(n-1) + fib1(n-2)
end

require 'benchmark'

#Benchmark.bmbm do |x|
#	x.report("iterative:") { fib(100000) }
#	x.report("meta:") { fib_iter(100000) }
#end

describe 'fibonacci' do
	it 'outputs nth fibonnaci' do
		fib(0).should eq 0
		fib(1).should eq 1
		fib(2).should eq 1
		fib(3).should eq 2
		fib(4).should eq 3
		fib(5).should eq 5
	end
end


# 12x12 multiplication grid printout
# Yes cheating with ruby but I refuse to write a for loop, ever.
def grid
12.times do |x|
	12.times do |y|
		print ((x+1) * (y+1)).to_s + " "
	end
	puts
end
end

# Prints odd number from 1-99
def odd
	(1..99).each { |x| if x % 2 == 1 then puts x end }
end


# Find largest int value in an int array
def int_find(arr)
	max = arr[0]
	arr.each do |num|
		max = num if num > max 
	end
	max
end

describe 'int_finder' do
	it 'should return max num in an array' do
		arr = [1,5,6,100,3,4,5,5]
		int_find(arr).should eq 100
	end
end
