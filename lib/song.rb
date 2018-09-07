require 'pry'

class Song

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :name, :artist_name

  def initialize(name = "", artist_name = "")
    @name, @artist_name = name, artist_name
  end


  def self.create
    song = Song.new()
    @@all << song
    return song
  end

  def self.new_by_name(name)
     Song.new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by(&:name.downcase)
  end

  def self.new_from_filename(filename)
    split_name = self.split_mp3_filename(filename)
    Song.new(split_name[1], split_name[0])
  end

  def self.create_from_filename(filename)
    split_name = self.split_mp3_filename(filename)
    # binding.pry
    song = self.create
    song.name = split_name[1]
    song.artist_name = split_name[0]
    return song
  end

  def self.split_mp3_filename(filename)
    return filename.split(".mp3")[0].split(" - ")
  end

  def self.destroy_all
    @@all = []
  end
end
