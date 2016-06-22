class AddGifColumnToResponseTable < ActiveRecord::Migration
  def change
		add_column :responses, :gif, :string, :default => "https://media.giphy.com/media/fXQd4ltb2My64/giphy.gif"
  end
end
