require "pry"

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(title_string)
    self.all.find{|song| song.name == title_string}
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    title = filename.split(" - ")[1][0..-5]
    # self.new(title, artist)
    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    title = filename.split(" - ")[1][0..-5]
    # self.new(title, artist)
    song = self.create
    song.name = title
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
