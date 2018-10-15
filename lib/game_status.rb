# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  !board.any? {|element| element == " " || element == ""}
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  elsif (!(won?(board)) && !full?(board)) ||  won?(board)
    return false
  end
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
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end

    end
    return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_side = won?(board)
  if winning_side == false
    return nil
  elsif board[winning_side[0]] == "X"
    return "X"
  elsif board[winning_side[0]] =="O"
    return "O"
    end

  end
