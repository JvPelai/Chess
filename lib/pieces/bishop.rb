require 'pry'
module Moves
    def white_bishop_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        p startpiece
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
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
        p move 
        if move[0] == move[1]  && move[0] < 0 #upleft
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1] && move[0] > 0 #downright
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def black_bishop_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
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
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1]  && move[0] < 0 #upleft
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def upright_valid?(tracked,color)
        pieces = get_color(color)
        if pieces.include?(tracked)
            false
        else
            true
        end
    end
        

end