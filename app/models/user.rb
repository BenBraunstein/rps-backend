class User < ApplicationRecord
    has_secure_password

    def games
        return self
    end

end
