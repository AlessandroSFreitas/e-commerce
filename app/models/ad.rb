class Ad < ApplicationRecord
  # Callback
  before_save :markdown_to_html

  belongs_to :category, counter_cache: true
  belongs_to :member, optional: true

  validates :title, :description_md, :description_short, :category, presence: true #, :picture
  validates :price, numericality: { greater_than: 0 }

  scope :descending_order, ->(quantity = 12, page = 1) { limit(quantity).order(created_at: :desc).page(page).per(12) }

  scope :to_the, ->(member) { where(member_id: member.id) }

  scope :list_for_categories, ->(id) { where(category: id) }

  scope :search, ->(term, page = 1) { where("lower(title) ILIKE ?", "%#{term.downcase}%").page(page).per(12) }

  has_attached_file :picture, styles: { large: "900x400#", medium: "286x258#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  monetize :price_cents

  private

  def markdown_to_html
    options = {
      filter_html: true,
      link_attributes: {
        rel: "nofollow",
        target: "_blank"
      }
    }

    extensions = {
    space_after_headers: true,
    autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(self.description_md)
  end
end
