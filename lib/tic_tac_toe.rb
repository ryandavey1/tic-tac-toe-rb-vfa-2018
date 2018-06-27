# Define your WIN_COMBINATIONS constant
# WIN_COMBINATIONS = [
#   [0,1,2],
#   [3,4,5],
#   [6,7,8],
#   [0,3,6],
#   [1,4,7],
#   [2,5,8],
#   [0,4,8],
#   [2,4,6]
# ]

# def turn_count(board)
#   counter = 0
#   board.each do |spot|
#     if spot =="X" || spot == "O"
#       counter += 1
#     end
#   end
#   return counter
# end

# def current_player(board)
#   turns = turn_count(board)
#   if turns % 2 == 0
#     return "X"
#   else 
#     return "O"
#   end
# end


# def display_board(board)
#   puts " #{board[0]} | #{board[1]} | #{board[2]} "
#   puts "-----------"
#   puts " #{board[3]} | #{board[4]} | #{board[5]} "
#   puts "-----------"
#   puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end

# def input_to_index(input)
#   input.to_i - 1
# end 

# def position_taken?(board, index)
#     if board[index] == " " || board[index] == "" || board[index] == nil
#       return false
#     else 
#       return true
#     end
# end

# def move(board, index, token)
#   board[index] = "#{token}"
# end

# def turn(board)
#   puts "Please enter 1-9:"
#     user_index = gets.chomp
#     input_index = input_to_index(user_index)
#     if valid_move?(board, input_index)
#       move(board, input_index)
#       puts display_board(board)
#     else
#       puts "That is an invalid entry!"
#       turn(board)
#     end 
# end

# # code your #valid_move? method here
# def valid_move?(board,index)
#   if index >= 0 && index <= 8
#     if !position_taken?(board, index)
#       return true
#     else 
#       return false
#     end
#   else 
#     return false
#   end
# end

# # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
# def position_taken?(board, index)
#     if board[index] == " " || board[index] == "" || board[index] == nil
#       return false
#     else 
#       return true
#     end
# end

# def won?(board)
#   WIN_COMBINATIONS.each {|win_combination|
#     win_index_0 = win_combination[0]
#     win_index_1 = win_combination[1]
#     win_index_2 = win_combination[2]

#     position_1 = board[win_index_0]
#     position_2 = board[win_index_1]
#     position_3 = board[win_index_2]

#     if position_1 == "X" && position_2 == "X" && position_3 == "X"
#       return win_combination
#     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#       return win_combination
#     end
#   }
#   return false
# end

# def full?(board)
#   board.all? {|index| index == "X" || index == "O"}
# end

# def draw?(board)
#   if !won?(board) && full?(board)
#     return true
#   else
#     return false
#   end
# end

# def over?(board)
#   if won?(board) || full?(board) || draw?(board)
#     return true
#   else
#     return false
#   end
# end

# def winner(board)
#   win_index = []
#   win_index = won?(board)
#   if win_index == false
#     return nil
#   else
#     if board[win_index[0]] == "X"
#       return "X"
#     else
#       return "O"
#     end
#   end
# end

# def play(board)
#     while !over?(board)
#       turn(board)
#     end
#     if won?(board)
#       puts "Congratulations #{winner(board)}!"
#     elsif draw?(board)
#       puts "Cats Game!"
#     end
#   end

  def play
    while !over(board)?
      turn(board)
    end
    if won(board)?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def over?
    won? || draw?
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(location, token)
    @board[location.to_i-1] = token
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position(combo[0]) == position(combo[1]) &&
      position(combo[1]) == position(combo[2]) &&
      position_taken?(combo[0])
    end
  end

  def draw?
    !won? && @board.all?{|token| token == "X" || token == "O"}
  end

  def winner
    if winning_combo = won?
      @winner = position(winning_combo.first)
    end
  end

  def position(location)
    @board[location.to_i]
  end

  def position_taken?(location)
    !(position(location).nil? || position(location) == " ")
  end
end
