require_relative 'game.rb'
Dir["pieces/*.rb"].each {|file| require_relative file}
module Moves
    attr_accessor :WHITE, :BLACK
    WHITE = {:pawn => "\u265f ", :knight => "\u265e ", :bishop => "\u265d ", :rook => "\u265c ", :queen => "\u265b ", :king => "\u265a "}
    BLACK = {:pawn => "\u2659 ", :knight => "\u2658 ", :bishop => "\u2657 ", :rook => "\u2656 ", :queen => "\u2655 ", :king => "\u2654 "}
    def white_piece_move(start,destination,startpiece,endpiece,moves,move)
        black_pieces = get_pieces("black")
        if moves.include?(move) && (endpiece == "\u25fe" || endpiece == "\u25fd")
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
            @valid = true
        elsif moves.include?(move) && black_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
            @valid = true
        else
            puts "Invalid move!", "\n"
        end
    end
    
    def black_piece_move(start,destination,startpiece,endpiece,moves,move)
        white_pieces = get_pieces("white")
        if moves.include?(move) && (endpiece == "\u25fe" || endpiece == "\u25fd")
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
            @valid = true
        elsif moves.include?(move) && white_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
            @valid = true
        else
            puts "Invalid move"
        end
    end

    def get_pieces(color)
        if color == "black"
            black_pieces = []
            BLACK.map do |key,value|
                black_pieces.push(value)
            end
            black_pieces
        else 
            white_pieces = []
            WHITE.map do |key,value|
                white_pieces.push(value)
            end
            white_pieces
        end
    end
end
