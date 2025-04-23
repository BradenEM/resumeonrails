class Resume < ApplicationRecord
  has_many :jobs, dependent: :destroy
end
