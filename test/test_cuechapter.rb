require 'minitest/autorun'
require 'cuechapter'
require 'rexml/document'

class CueChapterTest < MiniTest::Unit::TestCase
  def load_cuesheet(cuename)
  	File.read(File.join(File.dirname(__FILE__), "fixtures/#{cuename}.cue"))
	end
  
  def setup
    @cue_file = File.join(File.dirname(__FILE__), '/fixtures/test.cue')
    @xml_file = File.join(File.dirname(__FILE__), '/fixtures/test.xml')
    @cuechapter = CueChapter::CueChapter.new(@cue_file, @xml_file)
  end
  
  def test_conversion
  	@cuechapter.convert
  	
  	file = File.new(@xml_file)
  	xml = REXML::Document.new file
  	
  	titles=[]
  	starttimes=[]
  	
  	xml.elements.each("chapters/chapter/title") do |title|
  		titles << title.text
  	end
  	
  	xml.elements.each("chapters/chapter") do |chapter|
  		starttimes << chapter.attributes["starttime"]
  	end
    	
  	@cuechapter.songs.each_with_index do |song, i|
  		assert_equal "#{song[:performer]} - #{song[:title]}", titles[i]
  		assert_equal "#{song[:index].minutes}:#{song[:index].seconds}", starttimes[i]
  	end
  end
  
  def teardown
    File.delete(@xml_file)
  end
end