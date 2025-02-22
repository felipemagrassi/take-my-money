# frozen_string_literal: true

class CreatePerformances < ActiveRecord::Migration[7.1]
  def change
    create_table :performances do |t|
      t.references :event, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
