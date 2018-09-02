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

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(song)
    found_song = self.find_by_name(song)
    if found_song
      found_song
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
   alphabet_array = self.all.sort_by{|x| x.name}
   alphabet_array.uniq
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].chomp(".mp3")
    song.artist_name = file_name.split(" - ")[0]
    song
  end

  def self.create_from_filename(file_name)
    Song.new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all = []
  end

end
