class AddFieldsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :description, :string
  end
end
