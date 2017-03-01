# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #linear
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #Cross
  [0,4,8],
  [2,4,6],
  #Horizontal
  [0,3,6],
  [1,4,7],
  [2,5,8],
]


def won?(board)
win_index_1 = WIN_COMBINATIONS[0]
win_index_2 = WIN_COMBINATIONS[1]
win_index_3 = WIN_COMBINATIONS[2]

position_1 = board[win_index_1[0]]
position_2 = board[win_index_1[1]]
position_3 = board[win_index_1[2]]
position_4 = board[win_index_2[0]]
position_5 = board[win_index_2[1]]
position_6 = board[win_index_2[2]]
position_7 = board[win_index_3[0]]
position_8 = board[win_index_3[1]]
position_9 = board[win_index_3[2]]

#Horizontal
if position_1 == "X" && position_2 == "X" && position_3 == "X"
  return WIN_COMBINATIONS[0]
elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  return WIN_COMBINATIONS[0]

elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
  return WIN_COMBINATIONS[1]
elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
  return WIN_COMBINATIONS[1]

elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
  return WIN_COMBINATIONS[2]
elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
  return WIN_COMBINATIONS[2]

#vertical

elsif position_1 == "X" && position_4 == "X" && position_7 == "X"
  return WIN_COMBINATIONS[5]
elsif position_1 == "O" && position_4 == "O" && position_7 == "O"
  return WIN_COMBINATIONS[5]

elsif position_2 == "X" && position_5 == "X" && position_8 == "X"
  return WIN_COMBINATIONS[6]
elsif position_2 == "O" && position_5 == "O" && position_8 == "O"
  return WIN_COMBINATIONS[6]


elsif position_3 == "X" && position_6 == "X" && position_9 == "X"
  return WIN_COMBINATIONS[7]
elsif position_3 == "O" && position_6 == "O" && position_9 == "O"
  return WIN_COMBINATIONS[7]

#diagonal

elsif position_1 == "X" && position_5 == "X" && position_9 == "X"
  return WIN_COMBINATIONS[3]
elsif position_1 == "O" && position_5 == "O" && position_9 == "O"
  return WIN_COMBINATIONS[3]

elsif position_3 == "X" && position_5 == "X" && position_7 == "X"
  return WIN_COMBINATIONS[4]
elsif position_3 == "O" && position_5 == "O" && position_7 == "O"
  return WIN_COMBINATIONS[4]

    end
end

def full?(board)
if board.all? { |i| i != " " }
  true
else
  false
  end
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board) == false
    false
  else
    true
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false

end
end

def winner(board)

  win_index_1 = WIN_COMBINATIONS[0]
  win_index_2 = WIN_COMBINATIONS[1]
  win_index_3 = WIN_COMBINATIONS[2]

  position_1 = board[win_index_1[0]]
  position_2 = board[win_index_1[1]]
  position_3 = board[win_index_1[2]]
  position_4 = board[win_index_2[0]]
  position_5 = board[win_index_2[1]]
  position_6 = board[win_index_2[2]]
  position_7 = board[win_index_3[0]]
  position_8 = board[win_index_3[1]]
  position_9 = board[win_index_3[2]]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"

  elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
    return "X"
  elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
    return "O"

  elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
    return "X"
  elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
    return "O"

  #vertical

  elsif position_1 == "X" && position_4 == "X" && position_7 == "X"
    return "X"
  elsif position_1 == "O" && position_4 == "O" && position_7 == "O"
    return "O"

  elsif position_2 == "X" && position_5 == "X" && position_8 == "X"
    return "X"
  elsif position_2 == "O" && position_5 == "O" && position_8 == "O"
    return "O"


  elsif position_3 == "X" && position_6 == "X" && position_9 == "X"
    return "X"
  elsif position_3 == "O" && position_6 == "O" && position_9 == "O"
    return "O"

  #diagonal

  elsif position_1 == "X" && position_5 == "X" && position_9 == "X"
    return "X"
  elsif position_1 == "O" && position_5 == "O" && position_9 == "O"
    return "O"

  elsif position_3 == "X" && position_5 == "X" && position_7 == "X"
    return "X"
  elsif position_3 == "O" && position_5 == "O" && position_7 == "O"
    return "O"

      end
  end

