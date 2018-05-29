class Employer < ApplicationRecord
  has_one :account, :as => :user, dependent: :destroy
  has_many :jobs, dependent: :destroy
  accepts_nested_attributes_for :account
end
