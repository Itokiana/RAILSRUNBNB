class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.references :sender, index: true
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
