# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  state = 0
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" || board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      state = 1
      return combination
    end
  end
  if state == 0
    return false
  end
end

def full?(board)
  filled = 0
  board.each do |position|
    if position == "X" || position == "O"
      filled += 1
    end
  end
  if filled == 9
    return true
  else
    return false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board)
    return true
  elsif full?(board) && draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |combination|
      if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
        return "X"
      elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
        return "O"
      end
    end
  end
end
