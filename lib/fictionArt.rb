require 'RMagick'
require 'uri'
require 'open-uri'
require 'rainbow'
require 'rainbow/ext/string'

class FictionArt

	attr_accessor :image_chars
	attr_accessor :status   # for tests

  # Constructor function of FictionArt class
  def initialize(text = "nothing")
  	
  	@image_chars ||= ' .~:+=o*x^%#@'.chars.to_a
	check = Dir.glob("#{__dir__}/../images/#{text}.jpg")

    if check.length == 0
	  if text == "nothing"
	  	@status = false   # for tests
	  elsif text.nil? 
	  	@status = false   # for tests
	  	abort("Nothing inputted")
	  else
	  	@status = false   # for tests
	  	puts 
	  	check_possible(text)
      end
    else
      open(check[0]) { |file| @data = file.read }
      @status = true   # for tests
    end

  end


  # Create ascii Art of given fictional character
  def createAscii(options = {})
    if @status == true
      options = {"width" => 90, "color" => true}.merge(options)
	  img = Magick::Image.from_blob(@data).first
	  width  = options["width"]
	  scale  = (width.to_f / img.columns)
	    
	  height = ((img.rows * scale) / 2).to_i
	  # puts height
	  if height >= 100
	   	height = 80
	  end

	  border = "+#{'-' * width}+\n"
	  output = border.dup

	  img.resize!(width, height)
	  color_image   = img.dup if options["color"]
	  img           = img.quantize(@image_chars.length, Magick::GRAYColorspace).normalize
	  quantum_calc  = Magick::QuantumRange / (@image_chars.length - 1)

	    
	  img.view(0, 0, width, height) do |view|
	      
	    height.times do |i|
	        
	      output << '|'
	      width.times do |j|

	        character = @image_chars[view[i][j].red/quantum_calc]     

	        if options["color"]
	          pix       = color_image.pixel_color(j,i)
	          character = character.color(unified_rgb_value(pix.red), unified_rgb_value(pix.green), unified_rgb_value(pix.blue))
	        end

	        output << character
	      end

	      output << "|\n"
	    end
	  end


	  output << border
	  return output
	end
  end


  # Converting into unified rgb value from 0-255
  def unified_rgb_value(number)
    if defined?(Magick::QuantumDepth)
      return (Magick::QuantumDepth == 16) ? (number / 256) : number
    else
      return (Magick::QuantumRange == 65535) ? (number / 256) : number
    end
  end


  # Listing all currently possible characters
  def list_all
  	list = Dir.glob("#{__dir__}/../images/*.jpg")
  	list.each do |character|
  		puts character[/.*images\/(.*).jpg/,1]
  	end
  end


  # Checking matching characters from character inputted
  def check_possible(text)
  	puts "Possible Characters:"
  	list = Dir.glob("#{__dir__}/../images/*.jpg")
  	
  	list.each do |character|
  	  character = character[/.*images\/(.*).jpg/,1]
  	  if character.downcase.include? text.downcase
  		puts character
  	  elsif text.downcase.include? character.downcase
  	  	puts character
  	  end
  	end

  end

end
