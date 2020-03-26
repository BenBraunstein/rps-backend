class GamesController < ApplicationController

    def index 
        games = Game.all 
        render json: games
    end

    def create(params)
        game = Game.create(p1Id: params[p1Id], p2Id: params[p2Id], numRounds: params[numRounds])
        return game
    end




    # def judgeRound(params)
    #     roundWinner = whoWins(move1, move2)
    #     # Check if the game is now over

    #     # Otherwise start the next round
    # end

    # def whoWins(move1, move2)
    #     if((move1 == 'r' && move2 == 's') || (move1 == 'p' && move2 == 'r') ||(move1 == 's' && move2 == 'p'))
    #         return 'player1'
    #     elsif((move1 == 'r' && move2 == 'r') || (move1 == 'p' && move2 == 'p') ||(move1 == 's' && move2 == 's'))
    #         return 'tie'
    #     else return 'player2'
    #     end
    # end

end
