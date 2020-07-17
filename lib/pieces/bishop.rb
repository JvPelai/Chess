module Moves
    def white_bishop_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],destination[1]-start[1]] 
        if move[0] == 0 || move[1] == 0
            puts"Invalid move!"
            return
        else
            if move[0].abs > move[1].abs || move[1].abs > move[1].abs
                puts "Invalid move"
                return 
            end
        end
        move[0],move[1] = move[0]/move[0].abs, move[1]/move[1].abs
        if move[0] == move[1]  && move[0] < 0 #upleft
            return if !upleft_valid?(start,destination,"white")
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            return if !upright_valid?(start,destination,"white")
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1] && move[0] > 0 #downright
            return if !downright_valid?(start,destination,"white")
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            return if !downleft_valid?(start,destination,"white")
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def black_bishop_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],destination[1]-start[1]]
        if move[0] == 0 || move[1] == 0
            puts"Invalid move!"
            return
        else
            if move[0].abs > move[1].abs || move[1].abs > move[1].abs
                puts "Invalid move"
                return 
            end
        end
        move[0],move[1] = move[0]/move[0].abs, move[1]/move[1].abs
        if move[0] == move[1] && move[0] > 0 #downright
            return if !downright_valid?(start,destination,"black")
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            return if !downleft_valid?(start,destination,"black")
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1]  && move[0] < 0 #upleft
            return if !upleft_valid?(start,destination,"black")
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            return if !upright_valid?(start,destination,"black")
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def upright_valid?(start,destination,color)
        pieces = get_pieces(color)
        i = 1
        while i < destination[1] - start[1]
            tracked = @gameboard[start[0]-i][start[1]-1+i]
            if pieces.include?(tracked)
                puts "Invalid move"
                return false
            else
                i += 1
            end
        end
    end

    def upleft_valid?(start,destination,color)
        pieces = get_pieces(color)
        i = 1
        while i < start[0] - destination[0]
            tracked = @gameboard[start[0]-i][start[1]-1-i]
            if pieces.include?(tracked)
                puts "Invalid move"
                return false
            else
                i += 1
            end
        end
    end

    def downright_valid?(start,destination,color)
        pieces = get_pieces(color)
        i = 1
        while i < destination[0] - start[0]
            tracked = @gameboard[start[0]+i][start[1]-1+i]
            if pieces.include?(tracked)
                puts "Invalid move"
                return false
            else
                i += 1
            end
        end
    end

    def downleft_valid?(start,destination,color)
        pieces = get_pieces(color)
        i = 1
        while i < destination[0] - start[0]
            tracked = @gameboard[start[0]+i][start[1]-1-i]
            if pieces.include?(tracked)
                puts "Invalid move"
                return false
            else
                i += 1
            end
        end
    end
        

end