class AddStateToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :state, :string
  end
end
