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
  WIN_COMBINATIONS.detect do | extract |

    win_index_1 = extract[0]
    win_index_2 = extract[1]
    win_index_3 = extract[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

if position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return extract
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return extract
    elsif board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
      return [0,4,8]
    elsif board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O"
      return [0,4,8]
    elsif board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X"
      return [2,4,6]
    elsif board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
      return [2,4,6]
    else
      return false
  end
end
end
end


def full?(board)
  board.all?{|filled| filled == "X" || filled == "O"}
end


def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  wincombo = won?(board)
  if wincombo === nil
    return nil
  elsif board[wincombo[0]] == "X"
    return "X"
  elsif board[wincombo[0]] == "O"
    return "O"
  end
end
