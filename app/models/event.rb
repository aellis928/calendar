class Event < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, :location, :date, :time, :color, :presence => true
  # validates :description, :presence => true { message: "Need to add a description!" }
  validates :notify, acceptance: true
  validates :name, length: {maximum: 20}
end
