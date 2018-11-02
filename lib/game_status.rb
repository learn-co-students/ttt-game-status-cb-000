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
  [2,4,6],]



def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    winning_position = []
    win_combination.each { |position| winning_position << board[position]}
    if winning_position == ["X", "X", "X"] || winning_position == ["O", "O", "O"]
      return win_combination
    end
  end
  return false
end

def full?(board)
 board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  if won?(board) || !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
return  board[won?(board)[0]]
  end
end

# board = ["X", "X","X","X","X","X","X","X","X"]
#
# def won?(board)
#   WIN_COMBINATIONS.each do |win_combination|
#     winning_position = win_combination.select do |position|
#       board[position]
#       end
#     if winning_position == (["X", "X", "X"] || ["O", "O", "O"])
#       puts "WC"
#       return win_combination
#     else
#       puts "WP"
#       return winning_position
#   end
#   end
# end



# def won?(board)
#   WIN_COMBINATIONS.each do |win_combination|
#     position_1 = board[win_combination[0]]
#     position_2 = board[win_combination[1]]
#     position_3 = board[win_combination[2]]
#
#       if (position_1 == "X" && position_2 == "X" && position_3 == "X")
#         return win_combination
#       else
#         false
#       end
#     end
# end

# def won?(board)
# WIN_COMBINATIONS.each do |win_combination|
#
#   win_index_1 = win_combination[0]
#   win_index_2 = win_combination[1]
#   win_index_3 = win_combination[2]
#
#   position_1 = board[win_index_1]
#   position_2 = board[win_index_2]
#   position_3 = board[win_index_3]
#
#   if position_1 == "X" && position_2 == "X" && position_3 == "X"
#     return win_combination # return the win_combination indexes that won.
#   else
#     false
#   end
#   end
# end

# def won?(board)
# WIN_COMBINATIONS.each do |win_combination|
#
#   win_index_1 = win_combination[0]
#   win_index_2 = win_combination[1]
#   win_index_3 = win_combination[2]
#
#   position_1 = board[win_index_1]
#   position_2 = board[win_index_2]
#   position_3 = board[win_index_3]
#
#   if position_1 == "X" && position_2 == "X" && position_3 == "X"
#     return win_combination # return the win_combination indexes that won.
#   else
#     false
#   end
#   end
# end
