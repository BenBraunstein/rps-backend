class Game < ApplicationRecord
  has_many :rounds
  
  def winner
    winner = self.winnerId
  end

end
