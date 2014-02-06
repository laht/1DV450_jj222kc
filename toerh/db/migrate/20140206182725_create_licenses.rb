class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|

    	t.string "license_type", :limit => 100

    	t.timestamps
    end
  end
end
