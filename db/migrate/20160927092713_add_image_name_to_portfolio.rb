class AddImageNameToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :image_name, :string
  end
end
