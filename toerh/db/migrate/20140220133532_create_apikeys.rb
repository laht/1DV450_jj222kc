class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
    	t.references :application
    	t.integer "auth_token", :null => false
    	t.timestamps
    end
  end
end
