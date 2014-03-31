class ChangeVersionToVersionNumberInProfiles < ActiveRecord::Migration
  def change
  	remove_column :profiles, :version
  	add_column :profiles, :version_number, :integer
  end
end
