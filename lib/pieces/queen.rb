module Moves
    def white_queen_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1],[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],destination[1]-start[1]]
        if move[0].abs == move[1].abs && move[0] != 0
            move[0],move[1] = move[0]/move[0].abs, move[1]/move[1].abs
        elsif move[0] == 0 && move[1] != 0
            move[1] = move[1]/move[1].abs
        elsif move[1] == 0 && move[0] != 0
            move[0] = move[0]/move[0].abs
        else
            "invalid move"
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
        elsif move[0] == move[1]  && move[0] < 0 #upleft
            return if !upleft_valid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            return if !upright_valid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1] && move[0] > 0 #downright
            return if !downright_valid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            return if !downleft_valid?(start,destination)
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def black_queen_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1],[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],destination[1]-start[1]]
        if move[0].abs == move[1].abs && move[0] != 0
            move[0],move[1] = move[0]/move[0].abs, move[1]/move[1].abs
        elsif move[0] == 0 && move[1] != 0
            move[1] = move[1]/move[1].abs
        elsif move[1] == 0 && move[0] != 0
            move[0] = move[0]/move[0].abs
        else
            "invalid move"
        end
        if move == moves[0] #up
            return if !downvalid?(start,destination)
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
        elsif move[0] == move[1]  && move[0] < 0 #upleft
            return if !upleft_valid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            return if !upright_valid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1] && move[0] > 0 #downright
            return if !downright_valid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            return if !downleft_valid?(start,destination)
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end
end