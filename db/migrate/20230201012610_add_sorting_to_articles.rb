class AddSortingToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :sorting, :integer
  end
end
