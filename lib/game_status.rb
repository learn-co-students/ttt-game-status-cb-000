# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
      winner = []
      win_combination.each do |win_index|
        winner << board[win_index]
          end
            if winner[0] == winner[1] && winner[0] == winner[2] && winner[0] != " "
              return win_combination
              break
            end
          end
          false
        end

def full?(board)
    if board.all? {|i| i != " "}
      return true
    else false
    end
end

def draw?(board)
  if won?(board) == false
    return true
  else false
  end
end

def over?(board)
  if won?(board) != false
    return true
  elsif full?(board) == true
    return true
  else false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else win_combination = won?(board)
    board[win_combination[0]]
  end
end
