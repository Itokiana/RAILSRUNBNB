class CreateCalendriers < ActiveRecord::Migration[6.0]
  def change
    create_table :calendriers do |t|
      t.datetime :startDate
      t.datetime :endDate
        
      t.belongs_to :logement, index: true

      t.timestamps
    end
  end
end
