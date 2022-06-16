module Display

  def Display.show_chess_board(board)
    green_background = "\e[48;5;10m"
    white_background = "\e[48;5;255m"
    black_contour = "\e[38;5;0m"
    board.each_with_index do |row, row_index|
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
  end

  def Display.ask_for_piece
    puts "Please type in the position of a chess piece"
    validate_position(gets.chomp)
  end
  
  def Display.ask_for_position
    puts "Please type in the new position"
    validate_position(gets.chomp)
  end
  
  def Display.validate_position(position)
    return nil if position.length != 2
    columns = %w[A B C D E F G H]
    column = position[0].upcase
    row = Integer(position[1]) rescue nil
    column = columns.find_index {|i| i == column}
    return nil if column.nil? || row.nil?
    [column+1,row]
  end

end
