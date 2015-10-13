class CreateAcks < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :identifier, null: false, index: true
      t.string :title
      t.timestamps
    end

    create_table :acks do |t|
      t.string :item_identifier, null: false, index: true
      t.timestamps
    end
  end
end
