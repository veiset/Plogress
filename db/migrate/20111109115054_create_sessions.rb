class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.decimal :duration
      t.text :title
      t.date :created
      t.integer :subtask_id

      t.timestamps
    end
  end
end
