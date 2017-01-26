# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =  [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];

def won?(board)
    filledX = board.include?("X")
    filledO = board.include?("O")
    emptySpace = board.include?(" ")
    nilSpace = board.include?(nil)


    if filledX == false && filledO == false
        return false

    end

    if emptySpace == false && nilSpace == false
        return false
    end

    WIN_COMBINATIONS.each do |winArray|

        index1 = winArray[0]
        index2 = winArray[1]
        index3 = winArray[2]

        if board[index1] == "X" && board[index2] == "X" && board[index3] == "X"
            return index1,index2,index3
        end
        if board[index1] == "O" && board[index2] == "O" && board[index3] == "O"
            return index1,index2,index3
        end

    end #end of WIN_COMBINATIONS.each
end

def full?(board)
    emptySpace = board.include?(" ")
    nilSpace = board.include?(nil)

    if emptySpace == false && nilSpace == false
        return true
    end

end

def draw?(board)

    if won?(board) == false && full?(board) == true
        return true
    end
        return false



end
