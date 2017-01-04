def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  return false if board.any? { |position| position == " " }
  draw?(board)
end

def draw?(board)
  true if won?(board) == nil
end

def over?(board)
  return false if board.any? { |position| position == " " }
  draw?(board) || won?(board)
end

def winner(board)
  combo = won?(board)
  unless combo == nil
    winner = ( combo.all? { |index| board[index] == 'X' } ? 'X' : 'O' )
  end
end
