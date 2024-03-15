class AddCoverimageToSuperheros < ActiveRecord::Migration[7.1]
  def change
    add_column :superheros, :coverimage, :string
  end
end
