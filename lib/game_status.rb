# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
  ]
  
def won?(board)
  win_combo = []
  WIN_COMBINATIONS.each do |combination|
    x_count = []
    o_count = []
    combination.each do |index|
      case board[index]
      when "X"
        x_count.push(index)
      when "O"
        o_count.push(index)
      end
    end
    if x_count.length == 3
      return win_combo = x_count
    elsif o_count.length == 3
      return win_combo = o_count
    end
  end
  if win_combo != []
    return win_combo
  else
    return false
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  win = " "
  if won?(board) != false
     won?(board).each do |index|
      win = board[index]
    end
  else win = nil
  end
  return win
end

