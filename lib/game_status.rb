# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.detect do |wci|
    winX = wci.all? {|i| board[i] == 'X'}
    winO = wci.all? {|i| board[i] == 'O'}
    if winX || winO
      return wci
    end
  end
end

def full?(board)
  if (board.any? {|i|(i == "" || i == " ")})
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board)
    puts('won')
    return false
  elsif full?(board)
    puts('full')
    return true
  else
    puts('next turn')
    return false
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  end
end

def winner(board)
  wrow = won?(board)
  if wrow == nil
    return nil
  else
    return board[wrow[0]]
  end
end
