# bookmerge

*update* this project has moved to:

[https://github.com/marythought/sinatra]

...

(Original README follows:)

This is a work in progress which started with the idea to combine two public domain texts from Gutenberg.org using markov chains (Peter Pan and Beowulf, in this case), and evolved to where I'm now trying to build the app that will allow a user to choose two (or more?) books to combine from a list of possible (public domain) texts.

Ruby script using Gutenberg texts (cleaned by me) and markov_chains gem by Justin Domingue: https://github.com/justindomingue/markov_chains.

Help! How should I produce this?
* I want a webpage where a user can go and select (from a drop-down menu, probably) two texts, a number of sentences, and hit "run"
* Ruby text output appears in a box on the page (right now it 'puts' and also saves to a file)

Considerations:
* Really I wanted this to scrape Gutenberg, so that a person could choose any two books available, but their site is not friendly to non-humans. So instead I've downloaded and cleaned up about 20 texts that a user can choose from. Maybe an option to "suggest a book to add."
* Is Rails the best way to deploy a ruby script to app form? I have some experience with this but mainly as a database. Is there another, easier way?
* I wrote this in Ruby but considering what I want it to do, may be able to accomplish with HTML/CSS/JavaScript/JQuery instead. That's my last resort as I want to see if I can do it with Ruby first.

Any suggestions appreciated. Thank you!
