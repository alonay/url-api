class Link < ApplicationRecord
  validates :short, uniqueness: true
  validates_format_of :long,
    with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i,
    message: 'Invalid URL'
end
