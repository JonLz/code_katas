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

describe StringCalculator do
	before (:each) do 
		@str = StringCalculator.new
	end

	it "should have a method named add that takes 1 argument" do
	  expect { @str.add "","" }.to raise_error ArgumentError
		expect { @str.add ""}.to_not raise_error ArgumentError
	end

	it "should return nil if not passed a string" do
		@str.add([]).should be_nil
	end

	it "should return 0 if only one number is present or no delimiter is present" do
		@str.add("14").should eq 0
		@str.add("14-1").should eq 0
	end

	it "should return the sum of two numbers" do
		@str.add("1,2").should eq 3
		@str.add("8,15").should eq 23
	end

	it "should work for more than two numbers" do
		sum = 1123+123+11+1234+949
		str = '1123,123,11,1234,949'
		@str.add(str).should eq sum
	end
	
	it "should accept newlines as a delimiter" do
		@str.add('1 2 3').should eq 6
	end

	it "should accept a combination of newline and commas as delimiters" do
		@str.add('1,2 3,5 7').should eq 18
	end

	it "should not accept a comma followed by a newline or vice versa as delimiters" do
		@str.add('1, 2,3,4 7').should be_nil
		@str.add('1 ,3').should be_nil
	end
end














