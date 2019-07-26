require('rspec')
require('pry')
require('./lib/dictionary.rb')

describe('#word') do

  before(:each) do

  end

  describe('.all') do
    it "returns an empty hash when no words have been entered" do
      expect(Dictionary::Word.all).to eq({})
    end
  end

  describe('.save') do
    it "adds word to hash as key, with definition as value" do
      test = Dictionary::Word.new({:name => "flower", :def => "something you eat"})
      test.save
      expect(Dictionary::Word.all).to eq({"flower" => "something you eat"})
    end
  end

  describe('.clear') do
    it "resets the word hash to an empty hash" do
      test = Dictionary::Word.new({:name => "flower", :def => "something you eat"})
      test.save
      expect(Dictionary::Word.all).to eq({"flower" => "something you eat"})
      Dictionary::Word.clear
      expect(Dictionary::Word.all).to eq ({})
    end
  end

end
