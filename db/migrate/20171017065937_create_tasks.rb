class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :status, null: false, default: 0
      t.references :thesis, foreign_key: true

      t.timestamps
    end
  end
end
