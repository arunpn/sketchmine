class AddDownloadLinkToPins < ActiveRecord::Migration
  def change
    add_column :pins, :download_link, :string
  end
end
