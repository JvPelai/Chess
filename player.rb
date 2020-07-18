module Player
    def player1
        puts "\n", "What's your name?", "\n"
        @p1_name = gets.chomp
        @p1_lost_pieces = []
    end

    def player2
        puts "\n", "What's your name?", "\n"
        @p2_name = gets.chomp
        @p2_lost_pieces = []
    end
end