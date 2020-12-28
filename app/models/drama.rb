class Drama < ApplicationRecord
    has_many :reviews 
    has_many :users, :through => :reviews
    validates :name, presence: true, uniqueness: true
    validates :genre, presence: true 
    before_validation :make_title_case 
    accepts_nested_attributes_for :reviews
    

    def self.alphabetized
        all.order('name asc')
    end
    private

    def make_title_case
    self.name = self.name.titlecase
    self.genre = self.genre.titlecase 
    end
end
