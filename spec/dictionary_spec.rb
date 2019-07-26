require('rspec')
require('pry')
require('./lib/dictionary.rb')

describe('#word') do

  before(:each) do
    Dictionary::Word.clear
  end

  describe('.all') do
    it "returns an empty hash when no words have been entered" do
      expect(Dictionary::Word.all).to eq({})
    end
  end


  describe('.save') do
    it "adds word to hash as value, with definition as key" do
      test = Dictionary::Word.new({:name => "flower", :def => "something you eat"})
      test.save
      expect(Dictionary::Word.all).to eq({"something you eat" => "flower"})
    end
  end

  describe('.clear') do
    it "resets the word hash to an empty hash" do
      test = Dictionary::Word.new({:name => "flower", :def => "something you eat"})
      test.save
      expect(Dictionary::Word.all).to eq({"something you eat" => "flower"})
      Dictionary::Word.clear
      expect(Dictionary::Word.all).to eq ({})
    end
  end

  describe('.search') do
    it "retrieves a word based on the definition" do
      test = Dictionary::Word.new({:name => "flower", :def => "something you eat"})
      test.save
      expect(Dictionary::Word.search("something you eat")).to eq ("flower")
    end
  end

  describe('.delete') do
    it "deletes a specific word from the hash" do
      test = Dictionary::Word.new({:name => "flower", :def => "something you eat"})
      other_test = Dictionary::Word.new({:name => "flashdance", :def => "probably the worst movie of all time"})
      test.save
      other_test.save
      Dictionary::Word.delete("flower")
      expect(Dictionary::Word.all).to eq ({"probably the worst movie of all time" => "flashdance"})
    end
  end

  describe ('.update') do
    it "updates the entry in the hash with a new word value" do
      test = Dictionary::Word.new({:name => "flower", :def => "something you eat"})
      other_test = Dictionary::Word.new({:name => "flashdance", :def => "probably the worst movie of all time"})
      test.save
      other_test.save
      test.update("sticks and rocks")
      expect(Dictionary::Word.search("something you eat")).to eq("sticks and rocks")
    end
  end

end

describe ('#definition') do

  describe('.all') do
    it "returns an empty hash when no words have been entered" do
      expect(Dictionary::Definition.all).to eq({})
    end
  end

  describe('.save') do
    it "adds word to hash as value, with definition as key" do
      test = Dictionary::Definition.new({:def => "a great place to hang out and meet friends", :name => "jail"})
      test.save
      expect(Dictionary::Definition.all).to eq({"jail" => "a great place to hang out and meet friends"})
    end
  end

end
