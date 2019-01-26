class CreateFrames < ActiveRecord::Migration[5.2]
  def change
    create_table :frames do |t|
      t.boolean :last_frame,default: false
      t.integer :type_frame,default: 0

      t.timestamps
    end
  end
end
