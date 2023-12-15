class CreateBxBlockLandingpage3FrequentlyAskedQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :bx_block_landingpage3_frequently_asked_questions do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
