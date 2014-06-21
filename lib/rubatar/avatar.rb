require 'chunky_png'

module Rubatar
  class Avatar
    attr_accessor :width, :height, :output

    def initialize(width, height, output)
      @width = width
      @height = height
      @output = output
      @img = ChunkyPNG::Image.new(5, 5)
    end

    def size=(width, height)
      @width = width
      @height = height
    end

    def generate
      @img.set_pixel(1, 1, ChunkyPNG::Color.rgb(128, 214, 56))
    end

    def save
      copy_img = ChunkyPNG::Image.new(5, 5)
      copy_img.initialize_copy(@img)
      copy_img.resample_nearest_neighbor!(@width, @height)
      copy_img.save(@output)
    end
  end
end