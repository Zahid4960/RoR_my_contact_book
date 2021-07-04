class CreateContactBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_books do |t|
      t.string :first_name, null: false
      t.string :last_name, null: true
      t.integer :sex, null: false, comment: '1 => male, 2 => female, 3 => others'
      t.integer :age, null: false
      t.string :dop, null: false
      t.string :email, null: false
      t.text :address, null: true
      t.string :contact_no, null: false
      t.timestamps
    end
  end
end
