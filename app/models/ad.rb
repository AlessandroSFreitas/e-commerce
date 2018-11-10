class Ad < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :member, optional: true

  monetize :price_cents
end
