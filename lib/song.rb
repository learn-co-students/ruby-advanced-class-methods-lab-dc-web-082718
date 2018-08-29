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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort do |a, b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(file_name)
    arr = file_name.chomp(".mp3").split(" - ")
    song = Song.new_by_name(arr[1])
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(file_name)
    arr = file_name.chomp(".mp3").split(" - ")
    song = Song.create_by_name(arr[1])
    song.artist_name = arr[0]
    song
  end

  def self.destroy_all
    @@all = []
  end
end
