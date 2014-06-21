require 'rubatar/version'
require 'optparse'

if __FILE__ == $0
  OptionParser.new do |o|
    o.on('-w WIDTH') { |w| $width = w }
    o.on('-h HEIGHT') { |h| $height = h }
    o.on('-o OUTPUT') { |output| $output = output }
    o.on('--help') { puts o; exit }
    o.parse!
  end

  avatar = Rubatar::Avatar.new($width, $height, $output)
  avatar.generate
end