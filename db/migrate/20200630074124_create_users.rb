class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :job
      t.string :region
      t.string :instrument
      t.string :career
      t.string :introduction

      t.timestamps
    end
  end
end
