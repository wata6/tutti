class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :region
      t.string :instrument_requirement
      t.string :content

      t.timestamps
    end
  end
end
