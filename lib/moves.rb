require_relative 'game.rb'
module Moves
    attr_reader :WHITE, :BLACK
    WHITE = {:pawn => "\u265f ", :knight => "\u265e ", :bishop => "\u265d ", :rook => "\u265c ", :queen => "\u265b ", :king => "\u265a "}
    BLACK = {:pawn => "\u2659 ", :knight => "\u2658 ", :bishop => "\u2657 ", :rook => "\u2656 ", :queen => "\u2655 ", :king => "\u2654 "}
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
        elsif (move == [-1,-1] || move == [-1,1]) && black_pieces.include?(endpiece)
            @gameboard[destination[0]][destination[1]-1] = startpiece
            if (start[0].even? && (start[1]-1).even?) || (start[0].odd? && (start[1]-1).odd?)
                @gameboard[start[0]][start[1]-1] = "\u25fd"
            else
                @gameboard[start[0]][start[1]-1] = "\u25fe"
            end
        else
            puts "Invalid move"
        end  
    end

    def black_knight_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        black_piece_move(start,destination,startpiece,endpiece,moves,move)
    end
    
    def white_knight_moves(start,destination)
        black_pieces = get_pieces("black")
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        white_piece_move(start,destination,startpiece,endpiece,moves,move)
    end  

    def white_bishop_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        if move[0] == 0 || move[1] == 0
            puts"Invalid move!"
            return
        else
            move[0],move[1] = move[0]/move[0].abs, move[1]/move[1].abs
            if move[0].abs != 1 || move[1].abs !=1
                puts "Invalid move"
                return 
            end
        end
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
            move[0],move[1] = move[0]/move[0].abs, move[1]/move[1].abs
            if move[0].abs != 1 || move[1].abs !=1
                puts "Invalid move"
                return 
            end
        end
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

    def white_queen_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1],[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
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
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[1] #down
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[2] #left
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[3] #right
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1]  && move[0] < 0 #upleft
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1] && move[0] > 0 #downright
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            white_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def black_queen_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1],[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
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
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[1] #down
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[2] #left
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move == moves[3] #right
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1]  && move[0] < 0 #upleft
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] < move[1] && move[0] < 0 #upright
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] == move[1] && move[0] > 0 #downright
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        elsif move[0] > move[1] && move[0] > 0 #downleft
            black_piece_move(start,destination,startpiece,endpiece,moves,move)
        end
    end

    def white_king_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1],[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        white_piece_move(start,destination,startpiece,endpiece,moves,move)
    end

    def black_king_moves(start,destination)
        startpiece = @gameboard[start[0]][start[1]-1]
        endpiece= @gameboard[destination[0]][destination[1]-1]
        moves = [[-1,0],[1,0],[0,-1],[0,1],[1,1],[1,-1],[-1,-1],[-1,1]]
        move = [destination[0]-start[0],start[1]-destination[1]]
        black_piece_move(start,destination,startpiece,endpiece,moves,move)
    end
        
    def white_piece_move(start,destination,startpiece,endpiece,moves,move)
        black_pieces = get_pieces("black")
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
    
    def black_piece_move(start,destination,startpiece,endpiece,moves,move)
        white_pieces = get_pieces("white")
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

#elsif start == BLACK[:pawn]
    #moves = [[1,0],[2,0],[1,-1],[1,1]]
#end

