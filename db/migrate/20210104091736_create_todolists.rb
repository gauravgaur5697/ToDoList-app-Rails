class CreateTodolists < ActiveRecord::Migration[6.1]
  def change
    create_table :todolists do |t|
      t.string :Todo
      t.string :Time
      t.string :Date
      t.string :status
      t.string :important

      t.timestamps
    end
  end
end
