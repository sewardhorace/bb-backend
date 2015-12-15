class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.string :description
      t.string :tags, array: true
      t.datetime :time

      t.timestamps null: false
    end
  end
end
