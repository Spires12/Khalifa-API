class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birthday
      t.string :email              ,:default => "", :null => false, unique: true
      t.string :password_digest ,:default => "", :null => false
      t.datetime :reset_password_sent_at

      t.timestamps
    end
  end
end
