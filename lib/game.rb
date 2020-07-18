require_relative 'moves.rb'
require_relative '../player.rb'
require 'json'
class Game 
    include Player
    include Moves
    attr_accessor :gameboard
    def initialize
        game_mode
    end

    def game_mode
        puts "\n"
        puts "Do you wish to start a new game or load a saved one?"
        puts "1 - New game / 2 - Load game"
        mode = gets.chomp.to_i
        while mode != 1 && mode != 2 do
            puts "\nInvalid choice, press 1 to start a new game or 2 to load an existing save: \n"
            mode = gets.chomp.to_i
        end
        if mode == 1
            new_game
        else
            load_game
        end
    end

    def new_game
        player1
        player2 
        @turn = 1
        @gameboard = Board.new.board
        initial_pieces
        board_display
        match(@player1,@player2)
    end

    def match(p1_name,p2_name)
        @match_going = true
        while @match_going == true
            if @turn.odd?
                puts "It's #{@p1_name}'s turn.","\n"
                player_one_turn
                @turn += 1
                puts "\n","press s to save or enter to continue"
                s = gets.chomp
                if s == "s"
                    save_game
                end
            else
                puts "It's #{@p2_name}'s turn.","\n"
                player_two_turn
                @turn += 1
                puts "\n","press s to save or enter to continue"
                s = gets.chomp
                if s == "s"
                    save_game
                end
            end
        end
    end

    def player_one_turn
        puts "Choose a piece to move:", "\n"
        puts "1 - pawn, 2 - knight, 3 - bishop, 4 - rook, 5 - queen, 6 - king"
        piece = gets.chomp.to_i
        puts "\n", "Type the row of your piece location: "
        start_row = gets.chomp.to_i
        puts "\nAnd the column: "
        start_column = gets.chomp.to_i
        puts "\nType the row of the Destination of your move: "
        end_row = gets.chomp.to_i
        puts "\nAnd the Column: "
        end_column = gets.chomp.to_i
        @valid = false
        case piece
        when 1
            white_pawn_moves([start_row,start_column],[end_row,end_column])
        when 2
            white_knight_moves([start_row,start_column],[end_row,end_column])
        when 3
            white_bishop_moves([start_row,start_column],[end_row,end_column])
        when 4
            white_rook_moves([start_row,start_column],[end_row,end_column])
        when 5
            white_queen_moves([start_row,start_column],[end_row,end_column])
        when 6
            white_king_moves([start_row,start_column],[end_row,end_column])
        else
            puts "Invalid choice"
        end
        if @valid == false
            player_one_turn
        else
            sleep(1)
            board_display
        end
    end

    def player_two_turn
        puts "Choose a piece to move:", "\n"
        puts "1 - pawn, 2 - knight, 3 - bishop, 4 - rook, 5 - queen, 6 - king"
        piece = gets.chomp.to_i
        puts "\n", "Type the row of your piece location: "
        start_row = gets.chomp.to_i
        puts "\nAnd the column: "
        start_column = gets.chomp.to_i
        puts "\nType the row of the Destination of your move: "
        end_row = gets.chomp.to_i
        puts "\nAnd the Column: "
        end_column = gets.chomp.to_i
        @valid = false
        case piece
        when 1
            black_pawn_moves([start_row,start_column],[end_row,end_column])
        when 2
            black_knight_moves([start_row,start_column],[end_row,end_column])
        when 3
            black_bishop_moves([start_row,start_column],[end_row,end_column])
        when 4
            black_rook_moves([start_row,start_column],[end_row,end_column])
        when 5
            black_queen_moves([start_row,start_column],[end_row,end_column])
        when 6
            black_king_moves([start_row,start_column],[end_row,end_column])
        else
            puts "Invalid choice"
        end
        if @valid == false
            player_two_turn
        else
            sleep(1)
            board_display
        end
    end

    def board_display
        print "  "
        for i in 1..8 do
            print " " + i.to_s
        end
        print "\n"
        print "  "
        8.times do
            print " -"
        end
        print " \n"      
        @gameboard.each do |row,sqrs|
            print  row.to_s + "| " + sqrs.join("") + " |", "\n"
        end
        puts "\n"
    end

    def initial_pieces
        @gameboard[1][0], @gameboard[1][7] = BLACK[:rook], BLACK[:rook]
        @gameboard[1][1], @gameboard[1][6] = BLACK[:knight], BLACK[:knight]
        @gameboard[1][2], @gameboard[1][5] = BLACK[:bishop], BLACK[:bishop]
        @gameboard[1][3], @gameboard[1][4] = BLACK[:queen], BLACK[:king]
        @gameboard[2].map { |sqrs| sqrs.replace(BLACK[:pawn])}
        @gameboard[8][0], @gameboard[8][7] = WHITE[:rook], WHITE[:rook]
        @gameboard[8][1], @gameboard[8][6] = WHITE[:knight], WHITE[:knight]
        @gameboard[8][2], @gameboard[8][5] = WHITE[:bishop], WHITE[:bishop]
        @gameboard[8][3], @gameboard[8][4] = WHITE[:queen], WHITE[:king]
        @gameboard[7].map { |sqrs| sqrs.replace(WHITE[:pawn])}
    end

    def get_game_data(save_destiny)
        game_data = JSON.dump({
            :player1 => @p1_name,
            :player2 => @p2_name,
            :p1_lost_pieces => @p1_lost_pieces,
            :p2_lost_pieces => @p2_lost_pieces,
            :gameboard => @gameboard,
            :turn => @turn,
        })
        save_destiny.puts game_data
    end

    def save_game 
        puts "write the name you would like to give your save file"
        save_file_name = gets.chomp
        save_file_path = "save_data/" + save_file_name + ".json" 
        if File.file?(save_file_path)
            puts "This save file already exists, do you want to overwrite it? y/n"
            overwrite = gets.chomp
            if overwrite.downcase == 'n'
                puts 'write a new name for your file:'
                save_file_name = gets.chomp
                save_file_path = "save_data/" + save_file_name + ".json"
            end
        end
        save_destiny = File.open(save_file_path,'w') 
        get_game_data(save_destiny)
        puts "game saved succesfully"
    end

    def load_game
        files = Dir.children("save_data")
        puts "Select the file you wish to load: "
        files.each_with_index do |file,index|
            puts (index.to_i + 1).to_s + ": " + file
        end
        input = gets.chomp.to_i
        file_to_load = "save_data/" + files[input - 1]
        save = File.read(file_to_load)
        data = JSON.parse(save)
        load_data(data)
    end

    def load_data(data)
        @p1_name = data["p1_name"]
        @p2_name = data["p2_name"]
        @gameboard = data['gameboard']
        @turn = data["turn"]
        p @gameboard
        board_display
        match(@player1,@player2)
    end
end