
class Board
    attr_accessor :board
    def initialize
        @board = Hash.new{|r,c| r[c] = []}
        c = 1
        while c <=8
            if c.odd?
                for i in 1..8 do
                    if i.odd?
                        @board[c].push("\u25fe")
                    else
                        @board[c].push("\u25fd")
                    end
                end
                c += 1
            else
                for i in 1..8 do
                    if i.odd?
                        @board[c].push("\u25fd")
                    else
                        @board[c].push("\u25fe")
                    end
                end
                c += 1
            end
        end
        puts "\n"
        @board
    end
end
