class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

  def self.new_by_filename(filename)
    split_text = filename.split(" - ")
    song = self.new(split_text[1])
    # song.artist_name = Artist.new(split_text[0])
    song.artist_name = split_text[0]
    song.artist.songs << song
    song
  end

end
