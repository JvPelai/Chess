module Moves
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
end