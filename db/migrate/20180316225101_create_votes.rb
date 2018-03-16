class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :link, foreign_key: true, null: false
    end
  end
end
