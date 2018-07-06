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
  combination = for combination in WIN_COMBINATIONS
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]

    if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
      return combination
    elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
      return combination
    else
      false
    end
  end
  if combination.length == 3
    return combination
  else
    return false
  end
end

def full?(board)
  i = 0
  board.each do
    if position_taken?(board, i)
      i += 1
      if i == 9
        return true
      end
    else
      return false
    end
  end
end

def draw?(board)
  if full?(board)
    if won?(board)
      return false
    else
      return true
    end
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  else
    return false
  end
end


def winner(board)
  i = 0
  for combination in WIN_COMBINATIONS
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]

    if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
      return 'X'
    elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
      return 'O'
    else
      i += 1
      if i == 8
        return nil
      end
    end
  end
end
