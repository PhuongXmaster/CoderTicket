class AddHasPublishedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :has_published, :boolean
  end
end
