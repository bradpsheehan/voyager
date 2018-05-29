class Account < ApplicationRecord
  has_secure_password
  belongs_to :user, :polymorphic => true
end
