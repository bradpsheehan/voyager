class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :first_name, limit: 255, null: false
      t.string :last_name, limit: 255, null: false

      t.timestamps
    end
  end
end
