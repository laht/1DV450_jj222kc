class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string "firstname", :limit => 30
    	t.string "lastname", :limit => 30
    	t.string "email", :limit => 70, :default => "", :null => false
  		t.timestamps
    end
  end
end
