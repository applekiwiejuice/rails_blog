class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :toxic, default: false
      t.boolean :verified, default: false
      
      t.references :article
      t.timestamps
    end
  end
end
