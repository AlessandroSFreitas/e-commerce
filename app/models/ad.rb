class Ad < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :member, optional: true

  scope :descending_order, ->(quantity = 12) { limit(quantity).order(created_at: :desc) }
  scope :to_the, ->(member) { where(member_id: member.id) }

  has_one_attached :picture

  monetize :price_cents
end
