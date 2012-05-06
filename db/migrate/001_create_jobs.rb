class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.column :title, :string
      t.column :name, :string
      t.column :description, :text
      t.column :email, :string
      t.column :created_at, :date
    end
  end

  def self.down
    drop_table :jobs
  end
end
