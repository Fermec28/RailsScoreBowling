class CreateTries < ActiveRecord::Migration[5.2]
  def change
    create_table :tries do |t|
      t.integer :value

      t.timestamps
    end
  end
end
