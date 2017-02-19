# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], #horizontal wins
    [0,3,6], [1,4,7], [2,5,8], #vertical wins
    [0,4,8], [2,4,6] #diagonal wins
  ]

  #Test to see if there is a winning combination on the board
  def won?(board)
    WIN_COMBINATIONS.find do |win_combo|
      board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && position_taken?(board, win_combo[1])
  end
  end

#Test to see if the game board is full
  def full?(board)
    board.none?{|i| i == " " || i == ""}
  end

#Test to see if the game has ended in a Draw
  def draw?(board)
    full?(board) && won?(board) == nil
  end

#Test to see if the game is Overview
  def over?(board)
    draw?(board) || won?(board)
  end

#Test to determine which token is the winner
  def winner(board)
    if won?(board) != nil
      winner = board[won?(board)[0]]
    end
  end
