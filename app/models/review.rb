class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :drama 
    validates :rating, length: { maximum: 10 }

    def self.rating_limit
        all.where('rating desc').limit(10)
    end 
end
