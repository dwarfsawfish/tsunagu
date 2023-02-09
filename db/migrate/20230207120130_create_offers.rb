class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :email,              null: false
      t.integer :age,               null: false
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false
      t.string :house_number,       null: false
      t.string :building
      t.string :phone_number,       null: false
      t.text :academic_career,      null: false
      t.text :work_history,         null: false
      t.text :appeal
      t.references :user,           null: false
      t.references :job,            null: false
      t.timestamps
    end
  end
end
