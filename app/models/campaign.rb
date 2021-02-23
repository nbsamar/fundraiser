class Campaign < ApplicationRecord
  belongs_to :user
  enum status: %i[drafted approved rejected]
end
