class CreateResponses < ActiveRecord::Migration
  def change
		create_table :responses do |r|
			r.string :jobTitle
			r.string :jobDescription

			r.timestamps
		end
  end
end
