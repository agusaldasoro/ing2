class Bar < ApplicationRecord
  include Filterable

  scope :wifi, -> (has_wifi) { where(wifi: has_wifi) }
end
