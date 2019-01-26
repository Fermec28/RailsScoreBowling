class AddFrameRefToTry < ActiveRecord::Migration[5.2]
  def change
    add_reference :tries, :frame, foreign_key: true
  end
end
