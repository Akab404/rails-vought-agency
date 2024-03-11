class CreateSuperheros < ActiveRecord::Migration[7.1]
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :team
      t.string :image_url
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
