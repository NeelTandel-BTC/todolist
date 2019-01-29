class CreateTodolists < ActiveRecord::Migration[5.1]
  def change
    create_table :todolists do |t|
      t.boolean :status , default: false
      t.string :todo

      t.timestamps
    end
  end
end
