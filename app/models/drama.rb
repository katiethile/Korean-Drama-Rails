class Drama < ApplicationRecord
    has_many :reviews 
    has_many :users, :through => :reviews
    validates :name, uniqueness: true
    before_validation :make_title_case  
    accepts_nested_attributes_for :reviews
    accepts_nested_attributes_for :users 
    

    def self.alphabetized
        all.order('name asc')
    end
    private

    def make_title_case
    self.name = self.name.titlecase
    end
end
