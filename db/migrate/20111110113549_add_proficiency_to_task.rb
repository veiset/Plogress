class AddProficiencyToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :proficiency, :integer
  end
end
