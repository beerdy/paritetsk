class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.text :message
      t.string :contact

      t.timestamps null: false
    end
  end
end
