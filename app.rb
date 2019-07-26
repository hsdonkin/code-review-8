require('pry')
require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
also_reload('./lib/**/*.rb')
also_reload('./public/*.css')

get ('/') do
  erb :default
end

get ('/home') do
  erb :default
end

get ('/words') do
  "this is a list of all words"
end

get ('/words/:word')do
    @word = params[:word]
    @definitions = nil
    #this is a fucked up solution for multiple definitions
    #¯\_(ツ)_/¯
    match = Dictionary::Word.all.select{|k,v| v == @word}
    @definitions = match
    erb :word_page
end

get ('/delete/:word')do
    Dictionary::Word.delete(params[:word])
    redirect to ("/")
end

get('/update/:word')do
    @word = params[:word]
    @definitions = nil
    #this is a fucked up solution for multiple definitions
    #¯\_(ツ)_/¯
    match = Dictionary::Word.all.select{|k,v| v == @word}
    @definitions = match
    erb :update_word
end

post ('/update_word/:word') do
  Dictionary::Word.delete(params[:word])
  new_defs = params.select{|k,v| k =~ /new_def_*/}
  new_defs.each_value do |value|
    word = Dictionary::Word.new({:name => params[:word_name_update], :def => value})
    word.save
  end
  redirect to ("/")
end

post ('/add_word') do
  word_name = params[:input_word_name]
  word_def = params[:input_word_def]
  Dictionary::Word.new({:name => word_name, :def => word_def}).save
  redirect to ('/')
end
