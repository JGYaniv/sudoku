require_relative './lib/board.rb'

class Game

    attr_accessor :board

    def initialize
        #sudoku file location
        file_name = './puzzles/sudoku1.txt'

        #setup game board
        @board = Board.new(file_name)
    end

    def validate(pos, val)
        coordinates = pos.split(",").map{|num| num.to_i}

        x = coordinates[0]
        y = coordinates[1]

        row = @board.grid[y]
        column = @board.grid.map{|row| row[x]}

        #checks row
        return false unless row.none? {|tile| tile.value == val}

        #checks all columns
        return false unless column.none? {|tile| tile.value ==val}

        #returns true, b/c the value does not already exist in any row or column
        true
    end

    def get_input
        puts "Please enter an 'x,y' coordinate (ie '0,2' or '5,5'):"
        @pos = gets.chomp
        puts "Please enter a valid numeric value for the current board:"
        @val = gets.chomp

        until validate(@pos, @val) do
            puts "Invalid entry. Please enter an 'x,y' coordinate (ie '0,2' or '5,5'):"
            @pos = gets.chomp
            puts "Please enter a valid numeric value for the current board:"
            @val = gets.chomp
        end

        @pos = @pos.split(",")
        x = @pos[0].to_i
        y = @pos[1].to_i

        @board[x,y] = @val

    end

    def play

        until @board.solved? do
            system("clear")
            puts "Solved: #{@board.solved?}"
            @board.render
            get_input

            system("clear")
            @board.render
        end

    end

end

if __FILE__ == $PROGRAM_NAME

    game_1 = Game.new
    game_1.play

end
