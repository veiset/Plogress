class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :title
      t.integer :difficulty
      t.integer :level
      t.date :created

      t.timestamps
    end
  end
end
