class AddIndexToVendersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :venders, :email, unique: true
  end
end
