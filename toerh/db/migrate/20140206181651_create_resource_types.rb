class CreateResourceTypes < ActiveRecord::Migration
  def change
    create_table :resource_types do |t|

    	t.string "resource_type", :limit => 100

    	t.timestamps
    end
  end
end
