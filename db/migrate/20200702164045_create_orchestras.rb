class CreateOrchestras < ActiveRecord::Migration[5.2]
  def change
    create_table :orchestras do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :about
      t.string :concert_infomation
      t.string :instrument_requirement
      t.string :date
      t.string :conditions
      t.string :cost
      t.string :contact
      
      t.timestamps
    end
  end
end
