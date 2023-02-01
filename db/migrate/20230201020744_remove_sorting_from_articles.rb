class RemoveSortingFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :sorting, :integer
  end
end
