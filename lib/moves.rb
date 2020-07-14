module Moves
    PAWN_VALID = []
    def white_pawn_moves(start,destination)
        start = @gameboard[start[0][start[1]-1]]
        destination = @gameboard[destination[0][destination[1]-1]]
        valid?(start,destination)
    end

    def black_pawn_moves(start,destination)
        start = @gameboard[start[0]][start[1]-1]
    end
end
