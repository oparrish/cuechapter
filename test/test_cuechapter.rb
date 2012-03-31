require 'minitest/autorun'
require 'cuechapter'
require 'rexml/document'

class CueChapterTest < MiniTest::Unit::TestCase
  def setup
    @cue_file = './fixtures/test.cue'
    @xml_file = './fixtures/test.xml'
    @cuechapter = CueChapter::CueChapter.new(@cue_file, @xml_file)
  end
  
  def test_conversion
  	@cuechapter.convert
  	
  	file = File.new(@xml_file)
  	xml = REXML::Document.new file
  	
  	titles=[]
  	
  	xml.elements.each("chapters/chapter/title") do |title|
  		titles << title.text
  	end
    	
  	@cuechapter.songs.each_with_index do |song, i|
  		assert_equal "#{song[:performer]} - #{song[:title]}", titles[i]
  	end
  end
  
  def teardown
    File.delete(@xml_file)
  end
end