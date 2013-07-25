class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :password
      t.text :hobbies

      t.timestamps
    end
  end
end
