def won?(board)
  WIN_COMBINATIONS.each do |index|
    if board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X"
      match_array = [index]
    else
      false
    end
  end
end
