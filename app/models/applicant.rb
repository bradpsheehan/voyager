class Applicant < ApplicationRecord
  has_one :account, :as => :user, dependent: :destroy
  accepts_nested_attributes_for :account
end
