class CreateJoinTableMessagesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :messages_tags, id: false do |t|
      t.integer :message_id
      t.integer :tag_id
    end

    add_index :messages_tags, :message_id
    add_index :messages_tags, :tag_id
  end
end
