namespace :admin do
  desc "TODO"
  task activate_season: :environment do
    d = Date.current
    s = Season.find_by(start_date: d)
    s.update(active: true) if s
  end
end
