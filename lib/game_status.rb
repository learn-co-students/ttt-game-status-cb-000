# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [

  #HORIZONTALS
  [0,1,2],
  [3,4,5],
  [6,7,8],

  #VERTICALS
  [0,3,6],
  [1,4,7],
  [2,5,8],

  #DIAGONALS
  [0,4,8],
  [2,4,6]
]


def won?(board)
  for win_combination in WIN_COMBINATIONS
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    check1 = position_1 == "X" && position_2 == "X" && position_3 == "X"
    check2 = position_1 == "O" && position_2 == "O" && position_3 == "O"

    return win_combination  if check1 == true || check2 == true
  end
  return false
end

def full?(board)
  result = board.detect{|i| i==" "}
  if result == nil
    return true
  else
    return false
  end
end

def draw?(board)
  result = false
  if full?(board) && (won?(board) == false)
    result = true
  end
  return result
end

def over?(board)
  result = false
  result = true if draw?(board)
  result = true if full?(board)
  result = true if won?(board)
  return result
end

def winner(board)
  result = won?(board)
  if result.is_a?(Array)
    result = board[result[0]]
  else
    return nil
  end
  return result
end
