class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :superhero, null: false, foreign_key: true
      t.datetime :checkin
      t.datetime :checkout
      t.float :price
      t.boolean :accepted

      t.timestamps
    end
  end
end
