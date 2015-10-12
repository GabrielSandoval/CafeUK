class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
	  t.datetime :time
	  t.datetime :date
	  t.string :subject
	  t.text :message

	  t.references :user

      t.timestamps null: false
    end
  end
end
