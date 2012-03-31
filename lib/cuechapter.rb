require 'rubycue'
require 'builder'

module CueChapter
  class CueChapter 
    def initialize(cue_file, xml_file=nil, image_file=nil, link=nil)
      @cuesheet = RubyCue::Cuesheet.new(File.read(cue_file))
      @cuesheet.parse!
      
      if @xml_file.nil?
      	@xml_file=File.basename(cue_file).gsub(File.extname(cue_file),".xml")
      else
      	@xml_file = xml_file
      end
      
      @image_file = image_file
      @link = link
    end

    def convert
    	File.open(@xml_file, 'w') { |f| f.write(to_chapter_xml) }
    end
      
    def to_chapter_xml
      xml = Builder::XmlMarkup.new(:indent => 2)

      xml.chapters("version" => "1") {
        @cuesheet.songs.each do |song|
          xml.chapter("starttime" => "#{song[:index].minutes}:#{song[:index].seconds}") {
            xml.title "#{song[:performer]} - #{song[:title]}"
            xml.picture "#{@image_file}"
            xml.link "#{@link}"
          }
        end
      }
    end
  end
end