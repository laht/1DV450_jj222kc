class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
    	t.references :resource_type
    	t.references :user
    	t.references :license


    	t.timestamps
    end
  end
end
