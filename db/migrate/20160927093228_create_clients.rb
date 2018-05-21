class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :title
      t.text :description
      t.text :slave
      t.string :image_uid
      t.string :image_name
      t.string :url

      t.timestamps null: false
    end
  end
end
