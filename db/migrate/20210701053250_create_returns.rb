class CreateReturns < ActiveRecord::Migration[6.0]
  def change
    create_table :returns do |t|
      t.references :user
      t.references :library

      t.timestamps
    end
  end
end
