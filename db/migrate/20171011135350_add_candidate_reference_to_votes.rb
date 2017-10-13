class AddCandidateReferenceToVotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :candidate, index: true
    add_foreign_key :votes, :candidates
  end
end
