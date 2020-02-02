require 'colorize'

class Tile

    attr_accessor :value, :given

    def initialize(tile_value)
        @value = tile_value
        
        #sets @given to true if the starting number is anything but 0
        tile_value == "0" ? @given = false : @given = true

    end

    def print_tile
        if @given
            print @value.colorize(:red)
        elsif @value.to_i > 0
            print @value.colorize(:green)
        else
            print @value
        end
    end

end



