module Moves
    def white_rook_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if move[0] != 0 && move[1] != 0
            "invalid move"
        else
            if move[0] == 0
                move[1] = move[1]/move[1].abs
            else
                move[0] = move[0]/move[0.abs]
            end
        end
        if move == moves[0] #up
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[1] #down
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[2] #left
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[3] #right
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def black_rook_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if move[0] != 0 && move[1] != 0
            "invalid move"
        else
            if move[0] == 0
                move[1] = move[1]/move[1].abs
            else
                move[0] = move[0]/move[0.abs]
            end
        end
        if move == moves[0] #up
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[1] #down
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[2] #left
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[3] #right
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end
end