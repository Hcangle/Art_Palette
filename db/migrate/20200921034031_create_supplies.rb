class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name 
      t.string :image
      t.intiger :user_id 
    end 
  end
end
