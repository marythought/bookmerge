class Corpus
  def initialize
    @corpus = {
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
  end

  def add(books)
    books.each do |title, file|
      @corpus[title] = file
    end
  end

  def keys
    @corpus.keys
  end

  def lookup_file(title)
    @corpus[title]
  end

end

def combine_texts(text1, text2, library)
  file1 = File.read('texts/' + library.lookup_file(text1))
  file2 = File.read('texts/' + library.lookup_file(text2))
  wholetext = file1 + file2
end

# mycorpus = Corpus.new

# # test combine text
# puts combine_texts('Alice in Wonderland', 'The Yellow Wallpaper', mycorpus)

# # test lookup keys
# puts mycorpus.keys()
