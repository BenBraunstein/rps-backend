class User < ApplicationRecord
    has_secure_password

    def games
        games = Game.where(p1Id: self.id).or(Game.where(p2Id: self.id))
        return games
    end

end
