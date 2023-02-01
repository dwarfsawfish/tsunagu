class AddSortingIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :sorting_id, :integer
  end
end
