class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|

    	t.integer "auth_token", :null => false

    	t.timestamps
    end
  end
end
