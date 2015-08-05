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
# moved booklist into a class in new file, combine_text function there also
require './corpus.rb'

mycorpus = Corpus.new

# puts "Welcome to the book merger!"
# puts "You can choose two books from this list:"
# puts mycorpus.keys
# puts "..."
# puts "Please enter your first text:"
# text1 = gets.chomp
text1 = "The Bible"
puts "Please enter your second text"
# text2 = gets.chomp
text2 = "Ulysses"
puts "How many sentences? (max 100)"
# num_sentences = gets.chomp.to_i
num_sentences = 10

wholetext = combine_texts(text1, text2, mycorpus)

# run the text through the markov generator to randomize it and save sentences in an array
generator = MarkovChains::Generator.new(wholetext)
puts sentence_array = generator.get_sentences(num_sentences)

# let's not save a file anymore... getting annoying
# # let's make a shortcut for file name
# this_file = "markoved_#{text1.gsub(/\s+/, "")}_and_#{text2.gsub(/\s+/, "")}.txt"

# # save it as a text file, each sentence on a new line
# File.open(this_file, 'w+') do |file|
#   file.puts(sentence_array)
# end

# puts "all done! you can view your file at '#{this_file}'!"

# displaytext = File.read(this_file)


get '/' do
  @displaytext = sentence_array
  @corpus = mycorpus
  erb :index

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
