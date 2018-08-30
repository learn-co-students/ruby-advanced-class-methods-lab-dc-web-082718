class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.create_from_filename(name)
    new_song = new_from_filename(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    puts "falsey value"
    return nil
  end

  def self.new_from_filename(file_name)
    file_name_array = file_name.split
    artistname = file_name_array[0]
    file_name_array.shift
    file_name_array.shift
    song_name = file_name_array.join(" ")
    song_name = song_name.split('.')[0]
    puts "Song Name: #{song_name}"
    new_song = create_by_name(song_name)
    new_song.artist_name = artistname
    new_song
  end

  def self.find_or_create_by_name(name)
    #is_or_not = find_by_name(name)
    #puts "find_or_create_by_name: #{is_or_not}"
    #if is_or_not != "falsey value/n"
    #  return find_by_name(name)
    #else
    #  return create_by_name(name)
    #end
    check = find_by_name(name)
    if check == nil
      return create_by_name(name)
    else
      return check
    end
  end

  def self.alphabetical
    song_names = []
    sorted_songs = []
    @@all.each do |song|
      if song.name != nil
        song_names << song.name
      end
    end

    sorted_song_names = song_names.sort

    sorted_song_names.each do |song|
      sorted_songs << find_by_name(song)
    end
    sorted_songs

  end

  def self.destroy_all
    self.all.clear
  end



end
