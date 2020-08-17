class CreatePetsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string  :name
      t.integer :age
      t.string  :notes
    end 
  end
end
