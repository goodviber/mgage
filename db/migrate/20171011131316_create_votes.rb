class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :number
      t.string :validity
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
