class Category < ApplicationRecord
	has_many :trades
	resourcify
end
