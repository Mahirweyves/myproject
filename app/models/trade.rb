class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :commons, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  validates_acceptance_of :terms_and_conditions
  validates :terms_and_conditions, acceptance: true
  validates :title, :description, :images, :address, :category,
        :company_name, :telephone, :price, presence: true
  
  validates :images, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..2.megabytes }
  validates :title, uniqueness: { case_sensitive: false }
   
  resourcify 
end