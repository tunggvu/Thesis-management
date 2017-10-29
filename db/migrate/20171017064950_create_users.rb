class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role, null: false, default: 0
      t.string :password_digest

      t.index :email, unique: true

      t.timestamps
    end
  end
end
