class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :drama 
    validates :rating, presence: true, length: { maximum: 10 }
    validates :content, presence: true 
    validates :title, presence: true 

    def self.rating_limit
        all.where('rating desc').limit(10)
    end 
end
