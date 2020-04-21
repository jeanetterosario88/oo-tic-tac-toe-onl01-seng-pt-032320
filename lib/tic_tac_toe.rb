class TicTacToe
  attr_reader :board
  
  def initialize (board = nil)
    @board = Array.new(9, " ") #9 empty strings
  end
  
  WIN_COMBINATIONS = [
      [0,1,2], #toprow
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #left column
      [1,4,7], #middle column
      [2,5,8], #right column
      [0,4,8], #diagonal topleft to bottomright
      [2,4,6], #diagonal topright to bottomleft
      ]
      
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index (input)
    index = input.to_i - 1
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
    # if @board[index] == "O" || @board[index] == "X"
    #   true
    #   else 
    #   false
    # end
  end
  
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
    #   if position_taken?(index) == false && index.between?(0,8)
    #   true
    # else
    #   false
    # end
  end
  
  
  def turn
#     ask for input
# get input
# translate input into index
# if index is valid
#   make the move for index
#   show the board
# else
#   ask for input again
# end
    puts "Please enter a number between 1 and 9" 
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
    
    # input_to_index (input)
    # if valid_move? == true
    # display_board(@board)
    # else
    #   puts "Please make another move."
    #   input = gets.chomp
    #   input_to_index (input)
    # end
  end
  
  def turn_count
    @board.count do |token|
      token == "X" || token == "O"
    end
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |wincomboarray|
      if @board[wincomboarray[0]] == "X" && @board[wincomboarray[1]] == "X" && @board[wincomboarray[2]] == "X"
       return wincomboarray
      elsif @board[wincomboarray[0]] == "O" && @board[wincomboarray[1]] == "O" && @board[wincomboarray[2]] == "O"
       return wincomboarray
      end
    end
    false
  end
 
  def full?
    return false if @board[0..8].include?(" ")
    return true if !@board[0..8].include?(" ")
  end
      
  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end
      
  def over?
    if draw? == true || won? != false
      true
    else
    end
  end
  

  def winner
    if won? != false && @board[won?[0]] == "X"
      return "X"
    elsif won?!= false && @board[won?[0]] == "O"
      return "O"
    else
      nil
    end
  end


def play
  turn until over?
  if over?
    puts "Congratulations #{winner}!" if winner !=nil
    puts "The game ended with a draw." if draw?
end
end
    
end