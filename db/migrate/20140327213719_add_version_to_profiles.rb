class AddVersionToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :version, :string
  end
end
