class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name='', artist='')
    @name = name
    @artist_name = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    @@all << self.new(name)
    @@all[-1]
  end

  def self.find_by_name(name)
    @@all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(song)
    self.create_by_name(song)
    self.find_by_name(song)
  end

  def self.collect_song_names
    @@all.collect do |song_object|
      song_object.name
    end
  end

  def self.alphabetical
    collect_song_names.sort.collect{|song_name| find_by_name(song_name)}
  end

  def self.new_from_filename(filename)
    array = filename.split(' - ')
    array[1].chomp!('.mp3')
    Song.new(array[1], array[0])
  end

  def self.create_from_filename(filename)
    array = filename.split(' - ')
    array[1].chomp!('.mp3')
    @@all << Song.new(array[1], array[0])
  end

  def self.destroy_all
    @@all = []
  end

end
