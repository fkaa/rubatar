require 'chunky_png'

module Rubatar
  class Avatar
    attr_accessor :width, :height, :output

    def initialize(width, height, output)
      @width = width
      @height = height
      @output = output
      @img = ChunkyPNG::Image.new(5, 5)
      @color = ChunkyPNG::Color.parse(Hash.seed)
    end

    def size=(width, height)
      @width = width
      @height = height
    end

    def generate
      data = Array.new(25, 0)
      (0..5).each do |y|
        (0..5).each do |x|
          if x < 3
            data[x + y * 5] = (Hash::rand & 0x1).zero? ? 1 : 0
          else
            data[x + y * 5] = data[(4 - x) + y * 5];
          end
        end
      end

      data.each_with_index do |val, idx|
        unless val.zero?
          @img.set_pixel(idx % 5, idx / 5, @color)
        end
      end
    end

    def save
      #copy_img = ChunkyPNG::Image.new(5, 5)
      #copy_img.initialize_copy(@img)
      @img.resample_nearest_neighbor!(@width, @height)
      @img.save(@output)
    end
  end
end