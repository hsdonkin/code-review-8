module Dictionary

  class Word
    attr_accessor :name, :def
    attr_reader :id

    @@words_by_def = {}
    @@word_id_gen = 0

    def initialize(attr)
      @@word_id_gen +=1
      @name = attr.fetch(:name)
      @def = attr.fetch(:def)
    end

    def self.all
      @@words_by_def
    end

    def save
      hash = {self.def => self.name}
      @@words_by_def.merge!(hash)
    end

    def self.clear
      @@words_by_def = {}
    end

    def self.search(def_str)
      @@words_by_def.fetch(def_str)
    end

    def update(word_name)
        #delete the entry in the hash for this word, change the name in the object, then save it to the hash
        Dictionary::Word.delete(word_name)
        @name = word_name
        save
    end

    def self.delete(word_name)
      # reject returns the hash after the word name has been eliminated, and we set @@words_by_def to that new value
      @@words_by_def = @@words_by_def.reject{|k,v| v == word_name}
    end

  end

  class Definition
    attr_accessor :name, :def
    attr_reader :id
    @@def_by_word = {}
    @@def_id_gen = 0

    def self.all
      @@def_by_word
    end

    def initialize(attr)
      @@def_id_gen +=1
      @def = attr.fetch(:def)
      @name = attr.fetch(:name)
      # @id = attr.fetch(:id)
    end

    def save
      hash = {self.name => self.def}
      @@def_by_word.merge!(hash)
    end

    def self.clear
      @@def_by_word = {}
    end

    def self.search(word)
      @@def_by_word.fetch(word)
    end

    def self.delete(definition)
      # reject returns the hash after the word name has been eliminated, and we set @@words_by_def to that new value
      @@def_by_word = @@def_by_word.reject{|k,v| v == definition}
    end

    def update(definition)
        #delete the entry in the hash for this word, change the name in the object, then save it to the hash
        Dictionary::Definition.delete(definition)
        @def = definition
        save
    end

  end

end
