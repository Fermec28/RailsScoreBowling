class AddLineRefToFrame < ActiveRecord::Migration[5.2]
  def change
    add_reference :frames, :line, foreign_key: true
  end
end
