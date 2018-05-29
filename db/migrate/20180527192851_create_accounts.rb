class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :email, limit: 255, index: true, unique: true
      t.string :password_digest, limit: 255

      t.references :user, :polymorphic => true, index: true

      t.timestamps null: false
    end
  end
end
