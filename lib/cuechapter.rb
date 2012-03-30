require 'rubycue'
require 'builder'

module CueChapter
  class CueChapter 
    def initialize(cue_file, xml_file, image_file, link)
      @cuesheet = RubyCue::Cuesheet.new(File.read(cue_file))
      @cuesheet.parse!
      
      @xml_file = xml_file
      @image_file = image_file
      @link = link
    end

    def convert
      if xml_file.nil?
        puts chapter_xml
      else
        File.open(@options['xml'], 'w') { |f| f.write(chapter_xml) }
      end
    end
    
    private
    
    def chapter_xml
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