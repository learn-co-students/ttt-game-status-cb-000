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


def won?(array)
  WIN_COMBINATIONS.detect do | check |

    win_index_1 = check[0]
    win_index_2 = check[1]
    win_index_3 = check[2]

    position_1 = array[win_index_1]
    position_2 = array[win_index_2]
    position_3 = array[win_index_3]

if position_taken?(array, win_index_1) && position_taken?(array, win_index_2) && position_taken?(array, win_index_3)

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return check
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return check
    elsif array[WIN_COMBINATIONS[6][0]] == "X" && array[WIN_COMBINATIONS[6][1]] == "X" && array[WIN_COMBINATIONS[6][2]] == "X"
      return [0,4,8]
    elsif array[WIN_COMBINATIONS[6][0]] == "O" && array[WIN_COMBINATIONS[6][1]] == "O" && array[WIN_COMBINATIONS[6][2]] == "O"
      return [0,4,8]
    elsif array[WIN_COMBINATIONS[7][0]] == "X" && array[WIN_COMBINATIONS[7][1]] == "X" && array[WIN_COMBINATIONS[7][2]] == "X"
      return [2,4,6]
    elsif array[WIN_COMBINATIONS[7][0]] == "O" && array[WIN_COMBINATIONS[7][1]] == "O" && array[WIN_COMBINATIONS[7][2]] == "O"
      return [2,4,6]
    else
      return false
  end
end
end
end


def full?(array)
  array.all?{|filled| filled == "X" || filled == "O"}
end


def draw?(array)
  if !won?(array) && full?(array)
    true
  end
end


def over?(array)
  if won?(array) || draw?(array) || full?(array)
    true
  end
end

def winner(array)
  wincombo = won?(array)
  if wincombo === nil
    return nil
  elsif array[wincombo[0]] == "X"
    return "X"
  elsif array[wincombo[0]] == "O"
    return "O"
  end
end
