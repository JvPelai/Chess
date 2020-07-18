module Moves
    def black_pawn_moves(start,destination)
        white_pieces = get_pieces("white")
        startpiece = @gameboard[start[0]][start[1]-1]
        if startpiece.nil?
            puts "invalid"
            return
        end
        endpiece= @gameboard[destination[0]][destination[1]-1]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if (move == [1,0] || move == [2,0]) && (endpiece == "\u25fe" || endpiece == "\u25fd")
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
            @valid = true
        elsif (move == [1,-1] || move == [1,1]) && white_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
            @valid = true
        else
            puts "invalid move!"
        end  
    end

    def white_pawn_moves(start,destination)
        black_pieces = get_pieces("black")
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
            @valid = true
        elsif (move == [-1,-1] || move == [-1,1]) && black_pieces.include?(endpiece)
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
end