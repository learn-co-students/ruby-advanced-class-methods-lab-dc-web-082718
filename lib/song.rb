require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    song
  end

  def self.create_by_name(new_name)
    song = self.create
    song.name = new_name
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
      #remove .mp3
      file.slice!(".mp3")
      #remove artist name
      name_array = file.split(" - ") # returns array ["Taylor Swift", "Blank Space"]
      song = self.create
      song.name = name_array[1]
      song.artist_name = name_array[0]
      song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end

end
