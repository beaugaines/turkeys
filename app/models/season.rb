class Season < ApplicationRecord

  has_many :orders

  scope :active, -> { find_by(active: true) }

  def activate
    update(active: true)
  end

  def date_list=(dates)
    self.pick_up_dates = dates.gsub(/[^\d\/,]/, '').split(',')
  end

  def date_list
    self.pick_up_dates.join(',')
  end
end
