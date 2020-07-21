class Song
  attr_accessor :name, :artist_name
  @@all = []
  # @break = false

  # def initialize
  #   @artist_name = "Thundercat"
  # end

  # def artist_name=(artist)
  #   @artist_name = artist
  # end
  #
  # def artist_name
  #   @artist_name
  # end

  def self.create
    song = self.new


    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    # binding.pry
    song
  end

  def self.create_by_name(name)
    # if @break then binding.pry end
    song = self.new
    song.name = name

    @@all << song
    song
  end

  def self.find_by_name(name)

    @@all.select {|song| song.name == name}[0]
  end

  def self.find_or_create_by_name(name)
    # if @@all.select {|song| song.name == name}[0]
    if find_by_name(name)
      # @break = true
      find_by_name(name)

    else
      # @break = true
      # binding.pry
      create_by_name(name)
    end
  end

  def self.alphabetical
    # binding.pry
    @@all.sort { |obj1, obj2|
      obj1.name <=> obj2.name
    }
  end

  def self.new_from_filename (name)
    artist, song_name = name.split("-").collect { |word|
      word.strip
    }

    song = create_by_name(song_name[0...song_name.length-4])
    song.artist_name = artist #can't call a setter without 'self'

    song
  end


  def self.create_from_filename (name)
    artist, song_name = name.split("-").collect { |word|
      word.strip
    }

    song = create_by_name(song_name[0...song_name.length-4])
    song.artist_name = artist #can't call a setter without 'self'

    song.save
  end

  # def artist_name=(name)
  #   binding.pry
  #   @artist_name = name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = []
  end
end
