class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.datetime :date
      t.string :name
      t.string :note
      t.string :location

      t.timestamps
    end
  end
end
