class Ad < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :member, optional: true

  validates :title, :description, :category, presence: true #, :picture
  validates :price, numericality: { greater_than: 0 }

  scope :descending_order, ->(quantity = 12) { limit(quantity).order(created_at: :desc) }
  scope :to_the, ->(member) { where(member_id: member.id) }

  has_attached_file :picture, styles: { medium: "286x258#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  monetize :price_cents
end
