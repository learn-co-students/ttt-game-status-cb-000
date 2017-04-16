# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [3,4,5],
  [0,1,2],
  [6,7,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8]
]

def won?(board)
  # for each win combination, get index, load value
  result = nil

  WIN_COMBINATIONS.each do |win_combination|
    #second iteration [3,4,5 ]
    win_index_1 = win_combination[0] #3
    win_index_2  = win_combination[1] #4
    win_index_3 = win_combination[2] #5

    position_1 = board[win_index_1] #board[3] = "X"
    position_2 = board[win_index_2] #board[4] = "X"
    position_3 = board[win_index_3] #board[5] =  "X"

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      result = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      result = win_combination
    end
    end
    return result
  end

def full?(board)
  board.none? do |position|
    position == " "
  end
end

def draw?(board)
  if full?(board)  && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    champion = won?(board)
    return board[champion[0]]
    #return board[0] # replace 0 with won?board 0
  end
end
