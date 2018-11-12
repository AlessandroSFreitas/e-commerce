class Ad < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :member, optional: true

  has_attached_file :picture, styles: { medium: "700x400#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  monetize :price_cents

  scope :last_twelve_ads, -> { limit(12).order(created_at: :desc) }
end
