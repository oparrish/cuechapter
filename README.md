# cuechapter: Library to convert a cuesheet to an xml for use with Chapter X #
cuechatper is a Ruby library to convert CUE files into XML that can be used with [ChapterX](http://bluezbox.com/blog/25/chapterx-humble-chapter-tool-replacement) or GarageBand/ChapterTools.

## Usage ##
### CLI ###
Just convert a CUE to an XML with the same name

`cuechapter -c your_cue.CUE`

Convert a CUE to an XML with a specific name

`cuechapter -c your_cue.CUE -x xml_converted.xml`

Specify a picture of link

`cuechapter -c your_cue.CUE -p \path\to\picture.jpg -l http:\\www.yourlink.net`

### In Code ###
```ruby
require 'cuechapter'

cue\_file = "path\to\cue_file.CUE"
xml\_file = "path\to\xml_file.xml"
picture   = "path\to\picture.jpg"
link      = "http:\\www.yourlink.net"

cuechapter = CueChapter::CueChapter.new(cue_file, xml_file, picture, link)
cuechapter.convert
```
