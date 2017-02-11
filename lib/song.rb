class Song
  attr_accessor :name, :artist
  def initialize(name)
    @name=name
  end

  def self.new_by_filename(filename)
    new_song=Song.new(filename.split("-")[1].strip)
    if Artist.all.count==0
      new_song.artist=Artist.new(filename.split("-")[0].strip)
      new_song.artist.songs<<new_song.name
    else
      Artist.all.each do |art_object|
        if art_object.name==(filename.split("-")[0].strip)
          new_song.artist=art_object
          new_song.artist.songs<<new_song.name
        end
      end
      unless new_song.artist
        new_song.artist=Artist.new(filename.split("-")[0].strip)
        new_song.artist.songs<<new_song.name
      end
    end
    Artist.all<<new_song.artist unless Artist.all.include?(new_song.artist)
    new_song
  end

end
#require 'pry'
