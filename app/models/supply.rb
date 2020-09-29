class Supply < ActiveRecord::Base
  belongs_to :user
  validates :name, :brand, presence: true
end 
