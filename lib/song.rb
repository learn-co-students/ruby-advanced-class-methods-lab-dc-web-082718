class Song
  attr_accessor :name, :artist_name
  @@all = []
  # @break = false

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

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
