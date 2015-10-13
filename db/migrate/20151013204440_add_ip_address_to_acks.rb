class AddIpAddressToAcks < ActiveRecord::Migration
  def change
    add_column(:acks, :ip_address, :string)
  end
end
