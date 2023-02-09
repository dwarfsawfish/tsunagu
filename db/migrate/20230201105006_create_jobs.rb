class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :occupation_id,               null: false
      t.integer :status_id,                   null: false
      t.text    :work,                        null: false
      t.text    :training,                    null: false
      t.text    :license,                     null: false
      t.string  :age,                         null: false
      t.string  :work_area
      t.text    :salary,                      null: false
      t.text    :trial_salary,                null: false
      t.text    :time,                        null: false
      t.text    :holiday,                     null: false
      t.text    :benefit,                     null: false
      t.text    :benefit_supplement,          null: false
      t.text    :qualification,               null: false
      t.text    :emvironment,                 null: false
      t.text    :representative_message,      null: false
      t.string  :appeal,                      null: false
      t.references :company,                  null: false
      t.timestamps
    end
  end
end
