module Rubatar
  module Hash
    attr_reader :inc

    @@inc = Random::rand((2**(0.size * 8 -2) -1))

    def self.rand
      taps = 0x80306031
      seed = @@inc
      unless (seed & 0x1).zero?
        seed = (1 << 31) | ((seed ^ taps) >> 1)
      else
        seed = seed >> 1
      end
      @@inc = seed
      seed
    end

    def self.seed
      @@inc
    end
  end
end