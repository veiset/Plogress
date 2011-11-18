class AddDescriptionToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :description, :text
  end
end
