class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.boolean :gender
      t.datetime :birthday
      t.string :class_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end