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
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each do |wc|
    return wc if board[wc[0]] == 'X' && board[wc[1]] == 'X' && board[wc[2]] == 'X'
    return wc if board[wc[0]] == 'O' && board[wc[1]] == 'O' && board[wc[2]] == 'O'
  end
  false
end

def full?(board)
  board.each { |box| return false if box.nil? || box == '' || box == ' ' }
  true
end

def draw?(board)
  if ! won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  return true if won?(board) || full?(board) || draw?(board)
  false
end

def winner(board)
  winner = won?(board)
  return nil unless winner
  return 'O' if board[winner[0]] == 'O'
  return 'X' if board[winner[0]] == 'X'
end
