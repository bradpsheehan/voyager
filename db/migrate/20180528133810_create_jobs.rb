class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title, limit: 255, null: false
      t.text :description, null: false
      t.text :qualifications, null: false, array: true, default: []
      t.text :experiences, null: false, array: true, default: []
      t.text :benefits, null: false, array: true, default: []

      t.timestamps
    end
  end
end
