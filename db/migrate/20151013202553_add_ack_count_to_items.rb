class AddAckCountToItems < ActiveRecord::Migration
  def change
    add_column(:items, :ack_count, :integer)
  end
end
