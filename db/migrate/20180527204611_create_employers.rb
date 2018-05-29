class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :logo_url, limit: 255
      t.string :name, limit: 255, null: false, index: true

      t.timestamps
    end
  end
end
