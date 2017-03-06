# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

def won?(board)
  arrayX = []
  arrayO = []
  i = 0
  while i < board.length
    if board[i] == "X"
      arrayX << i
    elsif board[i] == "O"
      arrayO << i
    end


    i += 1
  end

  return false if board.all? {|x| x == " " }
  WIN_COMBINATIONS.each { |comb| return comb if comb.all? { |x| arrayX.include?(x) }}
  WIN_COMBINATIONS.each { |comb| return comb if comb.all? { |x| arrayO.include?(x) }}

  false

end

def full?(board)
  if board.any? {|x| x == " "}
    false
  elsif  won?(board) == false && !board.any? {|x| x == " " }
    true
  end

end

def draw?(board)
    return true if full?(board) == true
    false
end

def over?(board)
    return true if (draw?(board) || won?(board) != false )
    false
end

def winner(board)
  return board[won?(board)[0]] if won?(board) != false
  nil

end
