class MusicImporter
  attr_reader :path
  def initialize(path)
    @path = path
  end

  def files
    dir_files = Dir.glob("#{@path}/*")
    puts dir_files
    mp3s = dir_files.map do |file|

      split_file = file.split("/")
      split_file[4]
    end
    mp3s
  end




end
