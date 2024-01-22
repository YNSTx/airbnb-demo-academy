class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.string :title
      t.text :description
      t.integer :available_places

      t.timestamps
    end
  end
end
