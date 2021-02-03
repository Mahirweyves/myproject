class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :terms_of_service, acceptance: true
  validates :privacy_policy, acceptance: true
  validates_acceptance_of :terms_and_conditions
  has_many :trades

end
