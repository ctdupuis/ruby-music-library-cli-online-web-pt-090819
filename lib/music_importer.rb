require 'pry'

class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(path).select{|s| s.include?(".mp3")}
    # Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  
  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end