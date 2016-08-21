class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.string :name
      t.string :description
      t.string :location
      t.date :date
      t.time :time
      t.string :color
      t.string :notify

      t.timestamps
    end
  end
end
