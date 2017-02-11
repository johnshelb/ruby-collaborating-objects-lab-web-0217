class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path=path
  end

  def files
    mp3_array=[]
    dir=Dir["./spec/fixtures/mp3s/*.mp3"]
    for i in (0...dir.length)
      mp3_array<<dir[i].split("3s/")[1]
    end
    mp3_array
  end

  def import
    files.each do |song|
      sing_it=Song.new_by_filename(song)
      #binding.pry
    end
  end

end
require "pry"
