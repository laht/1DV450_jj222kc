class CreateApiApps < ActiveRecord::Migration
  def change
    create_table :api_apps do |t|
    	t.string "contact_mail", :null => false
    	t.timestamps
    end
  end
end
