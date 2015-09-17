class AddColumnsToUser < ActiveRecord::Migration
  def change
      add_column :users, :last_name, :string
      add_column :users, :first_name, :string
      add_column :users, :contact_number, :string
      add_column :users, :location, :string
      add_column :users, :longitude, :float
      add_column :users, :latitude, :float
      add_column :users, :gender, :string
      add_column :users, :age, :integer
      add_column :users, :birthday, :datetime
      add_column :users, :bio, :text
      add_column :users, :t_and_c, :boolean
      add_column :users, :admin, :boolean
      add_column :users, :member, :boolean
      add_column :users, :points, :integer
  end
end
