require_relative 'moves.rb'
class Game
    include Moves
    attr_accessor :gameboard
    def initialize
        @gameboard = Board.new.board
        initial_pieces
        board_display
        white_bishop_moves([8,3],[6,5])
        board_display
        sleep(1)
        white_bishop_moves([8,6],[6,4])
        board_display
        sleep(1)
        black_bishop_moves([1,2],[3,4])
        board_display
        sleep(1)
        black_bishop_moves([1,6],[3,4])
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