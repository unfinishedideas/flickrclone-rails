class Broadcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :broadcasts do |t|
      t.column(:id_members, :int)
      t.column(:description, :string)
      t.column(:tagged_id, :int)

      t.timestamps
    end
  end
end
