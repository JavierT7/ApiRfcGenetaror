class CreateRfcGenerated < ActiveRecord::Migration[5.2]
  def change
    create_table :rfc_generateds do |t|
      t.string  :rfc
      t.integer :counter
    end
  end
end
