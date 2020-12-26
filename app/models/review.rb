class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :drama 
    validates :rating, presence: true, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }
    validates :content, presence: true 
    validates :title, presence: true 

end
