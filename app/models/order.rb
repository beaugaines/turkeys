class Order < ApplicationRecord
  obfuscate_id
  belongs_to :season
  belongs_to :location
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  before_save :calculate_total
  after_create :update_inventory

  validates :phone_number, presence: true
  validates :pick_up_date, presence: true
  accepts_nested_attributes_for :order_items, reject_if: :blank_order_item

  private
  def blank_order_item(attributes)
    attributes['item_id'].nil? || attributes['quantity'].nil?
  end

  def calculate_total
    subtotal = order_items.map { |oi| oi.quantity * oi.item.price }.sum
    tax_total = subtotal * location.tax_rate if location.tax_rate
    self.subtotal = subtotal
    self.tax_total = tax_total
    self.total = subtotal + tax_total
  end

  def update_inventory
    total_turkey = order_items.map { |oi| oi.quantity }.sum
    if season.turkeys > total_turkey
      season.decrement!(:turkeys, total_turkey)
    end
    if season.turkeys < 1
      season.update(active: false, end_date: Time.now)
    end
  end
end
