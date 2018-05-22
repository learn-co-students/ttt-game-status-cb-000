# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [0,4,8], [1,4,7] , [6,4,2]]

def won?(board)
  counter=0
WIN_COMBINATIONS.each do |index|
  win_index_1 = index[0]
  win_index_2 = index[1]
  win_index_3 = index[2]
  position_1=board[win_index_1]
  position_2=board[win_index_2]
  position_3=board[win_index_3]
  if position_1 == "X"  && position_2 == "X" && position_3 == "X"
    counter+=1
    return index
  elsif position_1 == "O"  && position_2 == "O" &&   position_3 == "O"
    counter+=1
    return index
   end
  end
  if counter==0
    return false
  end
end


def won2?(board)
  counter=0
WIN_COMBINATIONS.each do |index|
  win_index_1 = index[0]
  win_index_2 = index[1]
  win_index_3 = index[2]
  position_1=board[win_index_1]
  position_2=board[win_index_2]
  position_3=board[win_index_3]
  if position_1 == "X"  && position_2 == "X" && position_3 == "X"
    counter+=1
  elsif position_1 == "O"  && position_2 == "O" &&   position_3 == "O"
    counter+=1
   end
  end
  if counter == 0
    return false
  else
    return true
  end
end


def won_x(board)
  counter=0
WIN_COMBINATIONS.each do |index|
  win_index_1 = index[0]
  win_index_2 = index[1]
  win_index_3 = index[2]
  position_1=board[win_index_1]
  position_2=board[win_index_2]
  position_3=board[win_index_3]
  if position_1 == "X"  && position_2 == "X" && position_3 == "X"
    counter= counter + 1
    return true
   end
  end
  if counter==0
    return false
  end
end

def full?(board)
  counter = 0
  board.each do |index|
    select_index = index
    if select_index == "X" || select_index == "O"
      counter= counter + 1
    end
  end
  if counter == 9
    return true
  else
    return false
 end
end


def draw?(board)
  if full?(board) == false
    return false
  elsif won2?(board) == true
    return false
  else
    return true
  end
end


def over?(board)
  if draw?(board) == true
    return true
  elsif won2?(board) == true
    return true
  else
    return false
  end
end


def winner(board)
  if won_x(board) == true && won2?(board) == true
    return "X"
  elsif won_x(board) == false && won2?(board) == true
    return "O"
  else
    return nil
  end
end
