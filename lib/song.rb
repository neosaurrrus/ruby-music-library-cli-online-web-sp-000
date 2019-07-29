class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, new_artist = nil, new_genre = nil)
    @name = name
    if new_artist == nil
      @artist = new_artist
    else
      self.artist=(new_artist)
    end
    if new_genre
        self.genre=(new_genre)
    else
      @genre = new_genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    newSong = Song.new(name, artist = nil, genre = nil)
    newSong.save
    newSong
  end

  def artist=(artist)
      @artist = artist
      artist.add_song(self)
  end

  def genre=(genre)
      @genre = genre
      genre.add_song(self)
  end

end
