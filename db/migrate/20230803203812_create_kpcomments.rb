class CreateKpcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :kpcomments do |t|
      t.string :content
      t.references :kpuser, null: false, foreign_key: true
      t.references :kppost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
