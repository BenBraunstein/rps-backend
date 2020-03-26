class GamesController < ApplicationController

    def index 
        games = Game.all 
        render json: games
    end

    def create
        game = Game.create(p1Id: params[:p1Id], p2Id: params[:p2Id], numRounds: params[:numRounds])
        Round.create(game_id: game, p1Move: params[:p1Move])
        return game
    end
    
    def update 
        game = Game.find(params[:id])
        currentRound = Game.rounds.last 
        currentRound.update(p2Move: params[:p2Move])
        roundWinner = whoWins(currentRound)
        numWins = howManyWins(game.numRounds)
        # Give the point to the winner
        if(roundWinner == 'player1')
            game.increment(:p1score, by = 1)
        elsif(roundWinner == 'player2')
            game.increment(:p2score, by = 1)
        end 
        # Check if someone has won
        if(game.p1score == numWins)
            game.update(winnerId: game.p1Id, complete?: true)
        elsif(game.p2score == numWins)
            game.update(winnerId: game.p2Id, complete?: true)
            # If no one has one start the next round
        else
            newRound = Round.create(game_id: game)
        end
        return game
    end

    def howManyWins(numRounds)
        return numRounds % 2 == 0 ? ((numRounds+1) / 2) + 1 : (numRounds / 2) + 1
    end

    # def judgeRound(params)
    #     roundWinner = whoWins(move1, move2)
    #     # Check if the game is now over

    #     # Otherwise start the next round
    # end

    def whoWins(currentRound)
        move1 = currentRound.move1
        move1 = currentRound.move1
        if((move1 == 'r' && move2 == 's') || (move1 == 'p' && move2 == 'r') ||(move1 == 's' && move2 == 'p'))
            return 'player1'
        elsif((move1 == 'r' && move2 == 'r') || (move1 == 'p' && move2 == 'p') ||(move1 == 's' && move2 == 's'))
            return 'tie'
        else return 'player2'
        end
    end

end
