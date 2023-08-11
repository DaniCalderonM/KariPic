class CreateKpimages < ActiveRecord::Migration[7.0]
  def change
    create_table :kpimages do |t|
      t.references :kpimageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
