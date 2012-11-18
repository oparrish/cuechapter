Gem::Specification.new do |s|
  s.name        = 'cuechapter'
  s.executables << 'cuechapter'
  s.version     = '0.0.3'
  s.date        = '2012-11-18'
  s.summary     = "Convert a cuesheet to a chapter XML file"
  s.description = "Converts a cuesheet file into a chapter XML file that can be used by ChatperX or GarageBand/ChapterTool to add chapters to an m4a/m4b file"
  s.authors     = ["Owen Parrish"]
  s.email       = 'owen.parrish@gmail.com'
  s.files       = ["lib/cuechapter.rb", "bin/cuechapter"]
  s.homepage    = 'https://github.com/oparrish/cuechapter'
  s.add_dependency 'rubycue', '>= 0.0.1'
  s.add_dependency 'builder', '>= 3.1.4'
  s.license     = 'MIT'
end
