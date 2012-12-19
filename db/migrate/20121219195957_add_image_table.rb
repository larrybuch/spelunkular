class AddImageTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :photo
      t.string :url
      t.string :anchorurl
      t.timestamps
    end
  end
end
