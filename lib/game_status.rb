# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8]
]

def won?(board)
  winning_combo = []

  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|spot| board[spot] == "X"}
      winning_combo = combo
    end
    if combo.all? {|spot| board[spot] == "O"}
      winning_combo = combo
    end
  end

  if winning_combo == []
    return false
  else
    return winning_combo
  end
end

def full?(board)
  board.none? do |spot|
    spot == "" || spot == " " || spot == nil
  end
end

def draw?(board)
  (full?(board) && !won?(board)) ? true : false
end

def over?(board)
  (full?(board) || draw?(board) || won?(board)) ? true : false
end

def winner(board)
  if won?(board) == false
    return nil
  else
    # won? returns an array if someone won, so use the first item in the
    # returned array to point to the index where you will find the winning
    # character
    return board[won?(board)[0]]
  end
end
