require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

def self.create
  song = self.new
  song.save
song
    end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.new_by_name (name)
song = self.create
song.name = name
song.save
song
end

def self.create_by_name (name)
song = Song.create
song.name = name
song.save
song
end



def self.find_by_name (name)
  @@all.find do |song|
  song.name == name
  end


end

def self.find_or_create_by_name(song_name)
self.find_by_name(song_name) || self.create_by_name(song_name)

end


  def self.alphabetical
    @@all.uniq.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
      song = Song.new
      song_array = file.split(" - ")
      song_name = song_array[1].chomp(".mp3")
      song.name = song_name
      song.artist_name = song_array[0]
      song

    end

    def self.create_from_filename(file)
      song = self.new_from_filename(file)
      song.save
    end

    def self.destroy_all
      @@all.clear
    end

  end
