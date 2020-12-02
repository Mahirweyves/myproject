class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :commons, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  validates_acceptance_of :terms
  validates :title, :description, :images, :address, :category,
        :company_name, :telephone, :price, presence: true
  
  validates :title, uniqueness: true

  def acceptable_image
  	return unless images.attached?

  	unless images.byte_size <= 5.kilobyte
  		errors.add(:images, "It's too big")
  	end
    
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(images.content_type)
    	errors.add(images, "must be a JPEG or PNG")
    end

  end
  resourcify 
end