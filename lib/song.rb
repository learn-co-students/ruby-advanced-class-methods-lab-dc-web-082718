require 'pry-byebug'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
      song = self.new
      song.save
      song
  end

  def self.new_by_name(name)
      song = self.new
      song.name = name
      song.save
      song
  end

  def self.create_by_name(name)
      song = self.new
      song.name = name
      song.save
      song
  end

  def self.find_by_name(name)
      self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      found = self.find_by_name(name)
      return found ? found : create_by_name(name)
  end

  def self.new_from_filename(name)
      song = self.new
      # binding.pry
      names = name.split(/-/)
      song.artist_name = names[0].strip
      song.name = names[1].strip.split(".")[0]
      song.save
      song
  end

  def self.create_from_filename(name)
      song = self.new
      # binding.pry
      names = name.split(/-/)
      song.artist_name = names[0].strip
      song.name = names[1].strip.split(".")[0]
      song.save
      song
  end

  def self.destroy_all
      self.all.clear
  end

  def self.alphabetical
      # binding.pry
      self.all.sort {|song1,song2| song1.name <=> song2.name}
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end
