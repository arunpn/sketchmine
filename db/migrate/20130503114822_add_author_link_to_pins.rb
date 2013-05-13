class AddAuthorLinkToPins < ActiveRecord::Migration
  def change
    add_column :pins, :author_link, :string
  end
end
