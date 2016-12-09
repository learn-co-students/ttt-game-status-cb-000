# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |win|
    values = board.values_at(*win)
    if values.all? {|i| i == 'X'} || values.all? {|i| i == 'O'}
      winner = win
      break
    end
  end
  winner
end

def full?(board)
  board.none? do |val|
    [nil, '', ' '].include?(val)
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    board[winner[0]]
  end
end
