class Job < ApplicationRecord
  belongs_to :employer
  has_many :job_applications, dependent: :nullify
end
