class CreateDramas < ActiveRecord::Migration[6.0]
  def change
    create_table :dramas do |t|
      t.string :name
      t.string :genre

      t.timestamps
    end
  end
end
