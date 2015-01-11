class Interval < ActiveRecord::Base
  belongs_to :intervaled, polymorphic: true
end
