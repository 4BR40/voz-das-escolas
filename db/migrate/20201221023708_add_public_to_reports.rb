class AddPublicToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :public, :boolean, default: true
  end
end
