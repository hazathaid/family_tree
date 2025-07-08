class CreateUserRelations < ActiveRecord::Migration[7.2]
  def change
    create_table :user_relations do |t|
      t.integer :user_id
      t.integer :relation_id
      t.integer :relation_as
      t.integer :child_order

      t.timestamps
    end
  end
end
