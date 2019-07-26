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

end
