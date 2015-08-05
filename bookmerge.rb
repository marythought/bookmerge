# optional, also allows you to specify version
gem 'markov_chains'
gem 'sinatra'

# require 'mechanize'
# mechanize = Mechanize.new
# text1 = mechanize.get('http://www.gutenberg.org/files/12/12-h/12-h.htm')
# puts text1.title

# I'd like to use Mechanize but Gutenberg doesn't have support for "non-human"
# users, so keeping this on the backburner for now.

# just require and use it
require 'markov_chains'
require 'sinatra'
require './corpus.rb'

# corpus = {
#   'The Adventures of Tom Sawyer' => 'tom_sawyer.txt',
#   'Alice in Wonderland' => 'alice_in_wonderland.txt',
#   'Anne of Green Gables' => 'anne_of_green_gables.txt',
#   'Beowulf' => 'beowulf.txt',
#   'The Bible' => 'the_bible.txt',
#   'The Brothers Grimm Fairy Tales' => 'grimms.txt',
#   'Jane Eyre' => 'jane_eyre.txt',
#   'Kama Sutra' => 'kama_sutra.txt',
#   'Little Women' => 'little_women.txt',
#   'Metamorphosis' => 'metamorphosis.txt',
#   'My Life, by Helen Keller' => 'helen_keller.txt',
#   'Peter Pan' => 'peter_pan.txt',
#   'A Picture of Dorian Gray' => 'dorian_gray.txt',
#   'Pride & Prejudice' => 'pride_and_prejudice.txt',
#   'Sherlock Holmes' => 'sherlock_holmes.txt',
#   '12 Years a Slave' => 'twelve_years_a_slave.txt',
#   'Ulysses' => 'ulysses.txt',
#   'War of the Worlds' => 'war_of_the_worlds.txt',
#   'The Wonderful Wizard of Oz' => 'wizard_of_oz.txt',
#   'The Yellow Wallpaper' => 'yellow_wallpaper.txt'
# }

mycorpus = Corpus.new

puts "Welcome to the book merger!"
puts "Your book options are as follows:"
puts mycorpus.keys
puts "..."
puts "Please enter your first text:"
text1 = gets.chomp
puts "Please enter your second text"
text2 = gets.chomp
puts "How many sentences? (max 100)"
num_sentences = gets.chomp.to_i

wholetext = combine_texts(text1, text2, mycorpus)
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
this_file = "markoved_#{text1.gsub(/\s+/, "")}_and_#{text2.gsub(/\s+/, "")}.txt"

# save it as a text file, each sentence on a new line
File.open(this_file, 'w+') do |file|
  file.puts(sentence_array)
end

puts "all done! you can view your file at '#{this_file}'!"

displaytext = File.read(this_file)

get '/' do
  displaytext
end




# require 'rubygems'
# require 'twitter'
# require 'sinatra'

# def twitter_id(screen_name)
#   Twitter.user(screen_name).id
# end

# def is_following?(a,b)
#   followers = Twitter.follower_ids(twitter_id(b)).ids
#   followers.include?(twitter_id(a))
# end

# get '/' do

#   erb :index
# end

# get '/follows' do
#   @user1 = params[:user1]
#   @user2 = params[:user2]

#   @following = is_following?(@user1, @user2)

#   erb :follows
# end

# from https://github.com/ashaw/ALA-Sample-Sinatra-App
