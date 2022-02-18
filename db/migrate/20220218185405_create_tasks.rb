class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :details
      t.date :schedule
      t.references :category
      t.references :user

      t.timestamps
    end
  end
end
