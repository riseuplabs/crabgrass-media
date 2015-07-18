require 'media/transmogrifier'
require 'media/mime_type'
require 'media/temp_file'

module Media

  #
  # creates a new instance of transmogrifier suitable for turning
  # input into output.
  #
  def self.transmogrifier(options)
    if options[:input_type]
      input_type = Media::MimeType.simple options[:input_type]
    elsif options[:input_file]
      input_type = Media::MimeType.mime_type_from_extension options[:input_file]
    else
      raise ArgumentError.new
    end

    if options[:output_type]
      output_type = Media::MimeType.simple options[:output_type]
    elsif options[:output_file]
      output_type = Media::MimeType.mime_type_from_extension options[:output_file]
    else
      raise ArgumentError.new
    end

    unless input_type and output_type
      raise ArgumentError.new("Both input and output types are required (given %s -> %s)." % [input_type||'nil', output_type||'nil'])
    end

    transmog_class = Transmogrifier.find_class(input_type, output_type)
    if transmog_class
      transmog_class.new(options)
    end
  end

  def self.may_produce?(src_type, dst_type)
    Transmogrifier.find_class(src_type, dst_type)
  end

  #
  # special graphicsmagick hooks.
  # we use graphicsmagick in order to parse the dimensions of image files.
  #

  def self.has_dimensions?(mime_type)
    if Transmogrifier.list["GraphicsMagickTransmogrifier"]
      Transmogrifier.list["GraphicsMagickTransmogrifier"].input_types.include? mime_type
    end
  end

  def self.dimensions(filepath)
    if Transmogrifier.list["GraphicsMagickTransmogrifier"]
      Transmogrifier.list["GraphicsMagickTransmogrifier"].dimensions filepath
    end
  end

end

