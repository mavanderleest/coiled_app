class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :name
			t.string :email
			t.integer :user_id
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :user_id
  end
end
