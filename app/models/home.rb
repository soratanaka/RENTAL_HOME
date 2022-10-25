class Home < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, allow_destroy: true, reject_if: :reject_nearest_stations

  private
  def reject_nearest_stations(attributes)
    attributes[:route].blank? || attributes[:station].blank? || attributes[:time].blank?
  end
end
