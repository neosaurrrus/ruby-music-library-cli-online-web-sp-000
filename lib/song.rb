class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

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


      @artist.add_song(self)
  end

  def genre=(genre)
      @genre = genre
      genre.add_song(self)
  end

  def self.new_from_filename(filename)
    split_filename= filename.split(" - ")
    puts split_filename
    new_artist = Artist.find_or_create_by_name(split_filename[0])
    new_genre = Genre.find_or_create_by_name(split_filename[2])
    Song.new(split_filename[1], new_artist, new_genre)

  end




end #of class
