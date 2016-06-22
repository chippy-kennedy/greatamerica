class AddPendingToResponses < ActiveRecord::Migration
  def change
		add_column :responses, :pending, :boolean, :default => false
  end
end
