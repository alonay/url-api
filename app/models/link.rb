class Link < ApplicationRecord
  validates :short, uniqueness: true
end
