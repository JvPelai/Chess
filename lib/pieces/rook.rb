module Moves
    def white_rook_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1]]
        move = [destination[0]-start[0],destination[1]-start[1]]
        if move[0] != 0 && move[1] != 0
            "invalid move"
        else
            if move[0] == 0
                move[1] = move[1]/move[1].abs
            else
                move[0] = move[0]/move[0].abs
            end
        end
        if move == moves[0] #up
            return if !upvalid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[1] #down
            return if !downvalid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[2] #left
            return if !leftvalid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[3] #right
            return if !rightvalid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def black_rook_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1]]
        move = [destination[0]-start[0],destination[1]-start[1]]
        if move[0] != 0 && move[1] != 0
            "invalid move"
        else
            if move[0] == 0
                move[1] = move[1]/move[1].abs
            else
                move[0] = move[0]/move[0].abs
            end
        end
        if move == moves[0] #up
            return if !upvalid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[1] #down
            return if !downvalid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[2] #left
            return if !leftvalid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[3] #right
            return if !rightvalid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def upvalid?(start,destination)
        i = 1
        while i < start[0]-destination[0]
            tracked = @gameboard[start[0]-i][start[1]-1]
            if tracked != "\u25fe" && tracked != "\u25fd"
                puts "invalid move"
                return false
            else
                i += 1
            end
        end
        true
    end

    def downvalid?(start,destination)
        i = 1
        while i < destination[0] - start[0]
            tracked = @gameboard[start[0]+i][start[1]-1]
            if tracked != "\u25fe" && tracked != "\u25fd"
                puts "invalid move"
                return false
            else
                i += 1
            end
        end
        true
    end

    def rightvalid?(start,destination)
        i = 1
        while i < destination[1] - start[1]
            tracked = @gameboard[start[0]][start[1]-1+i]
            if tracked != "\u25fe" && tracked != "\u25fd"
                puts "invalid move"
                return false
            else
                i += 1
            end
        end
        true
    end

    def leftvalid?(start,destination)
        i = 1
        while i < start[1] - destination[1] 
            tracked = @gameboard[start[0]][start[1]-1-i]
            if tracked != "\u25fe" && tracked != "\u25fd"
                puts "invalid move"
                return false
            else
                i += 1
            end
        end
        true
    end
end