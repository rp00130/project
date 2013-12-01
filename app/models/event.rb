class Event < ActiveRecord::Base
  scope :current_and_future, lambda { where('date >= ?', Date.today) }
  validates_presence_of :title,:date, :description 
end
