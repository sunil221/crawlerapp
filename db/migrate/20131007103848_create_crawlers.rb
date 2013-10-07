class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
