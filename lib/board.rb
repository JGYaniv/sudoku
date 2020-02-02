require_relative 'tile.rb'

class Board

    attr_accessor :board, :grid

    def initialize(sudoku_file)
        @grid = []
        puzzle_text = File.readlines(sudoku_file)
        puzzle_text.each do |row|
            @grid << row.chomp.chars.map {|tile_value| Tile.new(tile_value)}
        end

        render
    end

    def render
        @grid.each do |row|
            row.each do |tile|
                tile.print_tile
            end
            puts ("")
        end
    end

    def solved?
        solved = true
        @sequence = "123456789".split("")

        #checks all rows
        @grid.each do |row|
            sequenced_row = row.map{|tile| tile.value}.sort
            solved = false unless sequenced_row == @sequence
        end

        #checks all columns
        (0...@grid.length).each do |idx|
            @column = []
            @grid.each do |row|
                @column << row[idx].value
            end
            sequenced_column = @column.sort
            solved = false unless sequenced_column == @sequence
        end

        #returns results
        solved
    end

    def [](x, y)
        @grid[y][x].value
    end

    def []=(x, y, new_value)
        @grid[y][x].value = new_value
    end

end

