class Artist

  attr_reader :songs
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
  end

  def self.all #calls all-artists-array from Artists class
    @@all
  end

  def save
    self.class.all << self #saves this instance of Artist to all-artists-array
  end

  def self.find_or_create_by_name(artist_name)
    if self.all.find {|artist| artist.name == artist_name} != nil
      self.all.find {|artist| artist.name == artist_name}
    else
      new_artist = Artist.new(artist_name)
      new_artist.save
      new_artist
    end
  end

  def add_song(song) #artist instance songs << existing song object instance
    @songs << song
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
