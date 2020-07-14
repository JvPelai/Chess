require_relative 'moves.rb'
class Game
    include Moves
    WHITE = {:pawn => "\u265f ", :knight => "\u265e ", :bishop => "\u265d ", :rook => "\u265c ", :queen => "\u265b ", :king => "\u265a "}
    BLACK = {:pawn => "\u2659 ", :knight => "\u2658 ", :bishop => "\u2657 ", :rook => "\u2656 ", :queen => "\u2655 ", :king => "\u2654 "}
    attr_accessor :gameboard
    def initialize
        @gameboard = Board.new.board
        initial_pieces
        board_display   
    end

    def board_display
        print "  "
        for i in 1..8 do
            print " " + i.to_s
        end
        print "\n"
        print "  "
        8.times do
            print " -"
        end
        print " \n"      
        @gameboard.each do |row,sqrs|
            print  row.to_s + "| " + sqrs.join("") + " |", "\n"
        end
        puts "\n"
    end

    def initial_pieces
        @gameboard[1][0], @gameboard[1][7] = BLACK[:rook], BLACK[:rook]
        @gameboard[1][1], @gameboard[1][6] = BLACK[:knight], BLACK[:knight]
        @gameboard[1][2], @gameboard[1][5] = BLACK[:bishop], BLACK[:bishop]
        @gameboard[1][3], @gameboard[1][4] = BLACK[:queen], BLACK[:king]
        @gameboard[2].map { |sqrs| sqrs.replace(BLACK[:pawn])}
        @gameboard[8][0], @gameboard[8][7] = WHITE[:rook], WHITE[:rook]
        @gameboard[8][1], @gameboard[8][6] = WHITE[:knight], WHITE[:knight]
        @gameboard[8][2], @gameboard[8][5] = WHITE[:bishop], WHITE[:bishop]
        @gameboard[8][3], @gameboard[8][4] = WHITE[:queen], WHITE[:king]
        @gameboard[7].map { |sqrs| sqrs.replace(WHITE[:pawn])}
    end
end