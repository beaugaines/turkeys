class Season < ApplicationRecord

  def date_list=(dates)
    self.pick_up_dates = dates.gsub(/[^\d\/,]/, '').split(',')
  end

  def date_list
    self.pick_up_dates.join(',')
  end
end
