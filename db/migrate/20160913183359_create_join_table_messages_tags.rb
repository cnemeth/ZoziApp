class CreateJoinTableMessagesTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :messages, :tags do |t|
      t.index :message_id
      t.index :tag_id
    end
  end
end
