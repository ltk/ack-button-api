class Ack < ActiveRecord::Base
  belongs_to :item, counter_cache: :ack_count, foreign_key: :item_identifier
end
