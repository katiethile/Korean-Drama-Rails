class Drama < ApplicationRecord
    has_many :reviews 
    has_many :users, :through => :reviews
    validates :name, uniqueness: true 
    accepts_nested_attributes_for :reviews
    accepts_nested_attributes_for :users 

    def self.alphabetized
        all.order('name asc')
    end
end
