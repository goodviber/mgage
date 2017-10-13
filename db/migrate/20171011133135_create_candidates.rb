class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
