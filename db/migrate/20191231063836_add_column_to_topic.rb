class AddColumnToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :image_data, :binary
  end
end
