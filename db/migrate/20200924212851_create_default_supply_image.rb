class CreateDefaultSupplyImage < ActiveRecord::Migration
  def change
    change_column_default :supplies, :image, 'https://thumbs.dreamstime.com/b/creative-art-work-accessories-tools-supplies-set-messy-desk-paint-brushes-paintbox-watercolors-crayons-pencils-brown-wooden-140144701.jpg'
  end
end
