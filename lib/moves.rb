require_relative 'game.rb'
module Moves
    attr_reader :WHITE, :BLACK
    WHITE = {:pawn => "\u265f ", :knight => "\u265e ", :bishop => "\u265d ", :rook => "\u265c ", :queen => "\u265b ", :king => "\u265a "}
    BLACK = {:pawn => "\u2659 ", :knight => "\u2658 ", :bishop => "\u2657 ", :rook => "\u2656 ", :queen => "\u2655 ", :king => "\u2654 "}
    def black_pawn_moves(start,destination)
        white_pieces = []
        WHITE.map do |key,value|
            white_pieces.push(value)
        end
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if (move == [1,0] || move == [2,0]) && (endpiece == "\u25fe" || endpiece == "\u25fd")
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        elsif (move == [1,-1] || move == [1,1]) && white_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        else
            puts "invalid move!"
        end  
    end

    def white_pawn_moves(start,destination)
        black_pieces = []
        BLACK.map do |key,value|
            black_pieces.push(value)
        end
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if (move == [-1,0] || move == [-2,0]) && (endpiece == "\u25fe" || endpiece == "\u25fd")
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        elsif (move == [-1,-1] || move == [-1,1]) && black_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        else
            "Invalid move"
        end  
    end

    def black_knight_moves(start,destination)
        white_pieces = []
        WHITE.map do |key,value|
            white_pieces.push(value)
        end
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if moves.include?(move) && (endpiece == "\u25fe" || endpiece == "\u25fd")
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        elsif moves.include?(move) && white_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        else
            "Invalid move"
        end
    end
    
    def white_knight_moves(start,destination)
        black_pieces = []
        BLACK.map do |key,value|
            black_pieces.push(value)
        end
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if moves.include?(move) && (endpiece == "\u25fe" || endpiece == "\u25fd")
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        elsif moves.include?(move) && black_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        else
            "Invalid move"
        end
    end  
end

#elsif start == BLACK[:pawn]
    #moves = [[1,0],[2,0],[1,-1],[1,1]]
#end

