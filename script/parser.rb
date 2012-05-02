# Thanks to the example set at https://github.com/xml4r/libxml-ruby/wiki/Using-the-Reader-API
# http://snippets.dzone.com/posts/show/5051
# http://www.informit.com/articles/article.aspx?p=683059&seqNum=18

require 'rubygems'
require 'xml'

def extract(filename) #kml
  #container = libxmlmethodthatreadsxmlfile(filename) #../app/assets/xml/hydrants.xml
  #container = LibXML::Reader.file(filename, :options => LibXML::Parser::Options::NOBLANKS)
  # container = XML::Reader.file(filename, :options => XML::Parser::Options::NOBLANKS |
  #                                                   XML::Parser::Options::NOENT)
  return XML::Reader.file(filename, :options => XML::Parser::Options::NOBLANKS | XML::Parser::Options::NOENT)
end

#display a node's name: local and prefix
def display( node )
    return node.name, node.value
    #puts "\tName: #{node.name}"
    #puts " Value: #{node.value}" if node.has_value?
end

container = extract "../app/assets/xml/hydrants.xml"
prev_name = ""
seeds = ""
while container.read
  unless container.node_type == XML::Reader::TYPE_END_ELEMENT
    #puts "Node # " + i.to_s
    name, value = display container
    if prev_name == "coordinates"
      seed = "Thing.create(:city_id => 1, :lng => " + value.to_s.split(",").first + ", " + ":lat => " + value.to_s.split(",").last.split(",").first + ")"#  + value.to_s.split(",").first + " " + value.to_s.split(",").last.split(",").first
      seeds << seed + "\n"
    end
    prev_name = name
  end
end
#puts seeds.chop
File.open("../db/seeds.rb", 'w') {|f| f.write(seeds.chop) } #system("rake db:seed")

container.close