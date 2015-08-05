# optional, also allows you to specify version
gem 'markov_chains'

# require 'mechanize'
# mechanize = Mechanize.new
# text1 = mechanize.get('http://www.gutenberg.org/files/12/12-h/12-h.htm')
# puts text1.title

# I'd like to use Mechanize but Gutenberg doesn't have support for "non-human"
# users, so keeping this on the backburner for now.

# just require and use it
require 'markov_chains'

corpus = {
  'The Adventures of Tom Sawyer' => 'tom_sawyer.txt',
  'Alice in Wonderland' => 'alice_in_wonderland.txt',
  'Anne of Green Gables' => 'anne_of_green_gables.txt',
  'Beowulf' => 'beowulf.txt',
  'The Bible' => 'the_bible.txt',
  'The Brothers Grimm Fairy Tales' => 'grimms.txt',
  'Jane Eyre' => 'jane_eyre.txt',
  'Kama Sutra' => 'kama_sutra.txt',
  'Little Women' => 'little_women.txt',
  'Metamorphosis' => 'metamorphosis.txt',
  'My Life, by Helen Keller' => 'helen_keller.txt',
  'Peter Pan' => 'peter_pan.txt',
  'A Picture of Dorian Gray' => 'dorian_gray.txt',
  'Pride & Prejudice' => 'pride_and_prejudice.txt',
  'Sherlock Holmes' => 'sherlock_holmes.txt',
  '12 Years a Slave' => 'twelve_years_a_slave.txt',
  'Ulysses' => 'ulysses.txt',
  'War of the Worlds' => 'war_of_the_worlds.txt',
  'The Wonderful Wizard of Oz' => 'wizard_of_oz.txt',
  'The Yellow Wallpaper' => 'yellow_wallpaper.txt'
}

puts "Welcome to the book merger!"
puts "Your book options are as follows:"
puts corpus.keys
puts "..."
puts "Please enter your first text:"
text1 = gets.chomp
puts "Please enter your second text"
text2 = gets.chomp
puts "How many sentences? (max 100)"
num_sentences = gets.chomp.to_i

file1 = File.read('texts/' + corpus[text1])
file2 = File.read('texts/' + corpus[text2])
wholetext = file1 + file2
sentence_array = []

# run the text through the markov generator to randomize it and save sentences in an array

generator = MarkovChains::Generator.new(wholetext)
sentence_array << generator.get_sentences(num_sentences)

# num_sentences.times do |i|
#   i = markov.generate_1_sentence.strip
#   sentence_array << i
# end

# test that markov script is working and creating an array
# puts sentence_array
# puts sentence_array.class

# let's make a shortcut for file name
this_file = "markoved_#{corpus[text1]}_and_#{corpus[text2]}.txt"

# save it as a text file, each sentence on a new line
File.open(this_file, 'w+') do |file|
  file.puts(sentence_array)
end

puts "all done! you can view your file at 'markoved_#{corpus[text1]}_and_#{corpus[text2]}.txt'!"
puts File.read(this_file) do
  puts this_file
end


