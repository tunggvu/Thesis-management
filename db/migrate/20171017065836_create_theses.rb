class CreateTheses < ActiveRecord::Migration[5.1]
  def change
    create_table :theses do |t|
      t.string :name
      t.text :description
      t.string :progress, default: "0%"
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true
      t.string :thesis_type

      t.timestamps
    end
  end
end
