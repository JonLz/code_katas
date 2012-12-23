class WordLadder

  def initialize(start_word, last_word)
    @start = start_word
    @last = last_word
    @dictionary = dictionary
    @a_to_z = ('a'..'z').to_a
  end

  def solver
    ladder = Array.new
    
  end

  def letter_solver(start, last, position)
    try_word = String.new
    (0..3).each do |x|
      try_word << start[x] unless x == position
      try_word << last[x] if x == position
    end
    word = try_word if is_word?(try_word)
    word = nil if word == start
    nil || word
  end
  #ROCK 
  #MOCK
  #MICK
  #MILK

  def is_word?(word)
    @dictionary.include?(word.downcase)
  end

  def dictionary
    file = '/usr/share/dict/web2'
    dict = Array.new
    File.open(file, 'r').each do |word|
      word.chomp!
      dict << word.downcase if word.length == 4
    end
    dict
  end
end


require 'rspec'
describe WordLadder do
  it 'knows valid words and invalid words' do
    wl = WordLadder.new('ROCK', 'MILK')
    wl.is_word?('ROCK').should be_true
    wl.is_word?('RJIZ').should be_false
  end

  it 'loads a dictionary file of 4 letter words' do
    wl = WordLadder.new('','')
    wl.dictionary.should_not be_empty

    dict = wl.dictionary.dup
    dict.delete_if { |word| word.length == 4 }.should be_empty
  end

  describe '#letter_solver' do
    it 'can solve a single letter from start case to end case' do
      wl = WordLadder.new('ROCK','MILK')
      wl.letter_solver('ROCK','MILK',0).should eq "MOCK"
    end

    it 'returns nil if no word is found or the returned word equals the start word' do
      wl = WordLadder.new('ROCK','MILK')
      wl.letter_solver('ROCK','MILK',2).should be_nil # ROLK is not a word
      wl.letter_solver('ROCK','MILK',3).should be_nil # ROCK is the same as the start word
    end
  end




end