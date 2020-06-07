class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],

    [0,3,6],
    [1,4,7],
    [2,5,8],

    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board(board)
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(user_input)
    user_input.to_i - 1
  end


  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end


  def move(board, index, current_player)
    board[index] = current_player
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
  end


  def turn_count(board)
      count = 0
      @board.each do |spaces|
        if spaces == "X" || spaces == "O"
          count += 1
        end
      end
    return count
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  if valid_move?(board, index)
    p_token = current_player(board)
    move(board, index, p_token)
    display_board(board)
  else
    turn(board)
    end
  end

  def full?
    @board.any? {|cell| cell == "" || cell == " "}
  end

  def draw?
   !won? && full?
  end

  def over?
    won? || draw?
  end

 def winner(board)
   player = []
   player = won?(board)
   if player == false
     return nil
   else
     if @board[player[0]] == "X"
       return "X"
     else
       return "O"
      end
    end
  end

  def play(board)
    until over?(board) == true
      turn(board)
    end

    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"

    end
  end
end
