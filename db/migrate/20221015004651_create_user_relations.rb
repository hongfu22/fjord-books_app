class CreateUserRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_relations do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :user_relations, :follower_id
    add_index :user_relations, :followed_id
    add_index :user_relations, %i[follower_id followed_id], unique: true
  end
end
