class Interval < ActiveRecord::Base
  belongs_to :intervaled, polymorphic: true
  validates :description, :action, :group, :unit_of_measurement, presence: true
  validates :length, presence: true, numericality: { greater_than: 0 }
end
