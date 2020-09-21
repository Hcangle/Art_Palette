class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name 
      t.string :image
      t.integer :user_id 
    end 
  end
end
