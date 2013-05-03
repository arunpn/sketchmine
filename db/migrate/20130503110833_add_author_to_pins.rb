class AddAuthorToPins < ActiveRecord::Migration
  def change
    add_column :pins, :author, :string
  end
end
