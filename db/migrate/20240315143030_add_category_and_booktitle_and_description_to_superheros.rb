class AddCategoryAndBooktitleAndDescriptionToSuperheros < ActiveRecord::Migration[7.1]
  def change
    add_column :superheros, :category, :string
    add_column :superheros, :booktitle, :string
    add_column :superheros, :description, :string
  end
end
