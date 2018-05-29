class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :job_applications do |t|
      t.belongs_to :applicant, index: true, foreign_key: true
      t.belongs_to :job, index: true, foreign_key: true
      t.hstore :experiences, default: {}
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
