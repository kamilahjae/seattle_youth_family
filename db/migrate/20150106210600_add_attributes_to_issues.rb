class AddAttributesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :category, :string
    add_column :issues, :sub_category, :string
    add_column :issues, :organization, :string
    add_column :issues, :description, :text
    add_column :issues, :workshop_date, :datetime
  end
end
