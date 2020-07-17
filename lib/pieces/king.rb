module Moves
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
end