# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  winning_combo = []

  WIN_COMBINATIONS.each do |win_combination|
    x_winner = win_combination.all? do |position|
      board[position] == "X"
    end

    o_winner = win_combination.all? do |position|
      board[position] == "O"
    end

    if x_winner || o_winner
      winning_combo = win_combination
    end
  end

  if winning_combo != []
    winning_combo
  else
    false
  end
end

def full?(board)
  board.all? { |position| position == "X" || position == "O" }
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    position = won?(board)[0]
    board[position]
  else
    nil
  end
end
