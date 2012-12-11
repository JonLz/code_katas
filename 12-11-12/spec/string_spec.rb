=begin
String Calculator

Create a simple String calculator with a method int Add(string numbers)
The method can take 0, 1 or 2 numbers, and will return their sum (for an empty string it will return 0) for example “” or “1” or “1,2”

Start with the simplest test case of an empty string and move to 1 and two numbers
Remember to solve things as simply as possible so that you force yourself to write tests you did not think about
Remember to refactor after each passing test

Allow the Add method to handle an unknown amount of numbers

Allow the Add method to handle new lines between numbers (instead of commas).
the following input is ok:  “1\n2,3”  (will equal 6)
the following input is NOT ok:  “1,\n” (not need to prove it - just clarifying)

Support different delimiters
to change a delimiter, the beginning of the string will contain a separate line that looks like this:   “//[delimiter]\n[numbers…]” for example “//;\n1;2” should return three where the default delimiter is ‘;’ .
the first line is optional. all existing scenarios should still be supported

Calling Add with a negative number will throw an exception “negatives not allowed” - and the negative that was passed.if there are multiple negatives, show all of them in the exception message

stop here if you are a beginner. Continue if you can finish the steps so far in less than 30 minutes.

Numbers bigger than 1000 should be ignored, so adding 2 + 1001  = 2

Delimiters can be of any length with the following format:  “//[delimiter]\n” for example: “//[***]\n1***2***3” should return 6

Allow multiple delimiters like this:  “//[delim1][delim2]\n” for example “//[*][%]\n1*2%3” should return 6.
make sure you can also handle multiple delimiters with length longer than one char
=end

require 'string'
require 'spec_helper'

describe StrCalc do
	it "should be a defined class" do
		StrCalc.instance.should be_kind_of(StrCalc)
	end

	it "should not respond to instantiation" do
		expect { StrCalc.new }.to raise_error NoMethodError
	end

	describe '#add' do
		it "takes a string and only a string" do
			StrCalc.add("").should_not be_nil
			StrCalc.add([]).should be_nil
			StrCalc.add({}).should be_nil
		end

		it "returns the sum of a delimited list of numbers" do
			StrCalc.add("5,5,5,5").should eq 20
		end

		it "returns 0 for only one number passed" do
			StrCalc.add('100').should eq 0
		end

		it "supports newlines or commas" do
			StrCalc.add('1 2 3 4,5,6').should eq 21
			StrCalc.add('1 2 3 4 5 6').should eq 21
		end

		it "supports multiple delimiters" do
			#//[delimiter]\n
			StrCalc.add('//-\n400-900-1-2-3-4-5').should eq 1315
			StrCalc.add('//+\n400+900+1+2+3+4+5').should eq 1315
		end

		xit "will throw an exception for negative numbers" do
			StrCalc.add('-1,4,5,9,13,-8').should eq "negatives not allowed"
			StrCalc.add('//+\n1+4+5+9+13+-8').should eq "negatives not allowed"
		end
	end

end