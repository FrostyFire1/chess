module Display

  def Display.show_chess_board(board)
    green_background = "\e[48;5;10m"
    white_background = "\e[48;5;255m"
    black_contour = "\e[38;5;0m"
    board.each_with_index do |row, row_index|
      print "#{8-row_index} "
      row.each_with_index do |square, column_index|
        background = 
        if (row_index + column_index) % 2 == 0
          green_background
        else
          white_background
        end
        if square.nil?
          square = "  "
        else
          square = square.symbol+" "
        end
        print "#{background}#{black_contour}#{square}\e[0m"
      end
      puts
    end
    puts "  A B C D E F G H"
  end

  def Display.ask_for_piece
    puts "Please select a chess piece"
    gets.chomp
  end
  
  def Display.ask_for_position
    puts "Please select a move"
    gets.chomp
  end
end
