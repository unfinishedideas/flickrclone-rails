class Members < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.column(:name, :string)
      t.column(:fav_img_id, :int)

      t.timestamps
    end
  end
end
