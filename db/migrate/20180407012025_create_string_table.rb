class CreateStringTable < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :long
      t.string :short
      t.integer :visits, default: 0
    end

    add_index :links, :short, unique: true
  end
end
