class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :seo_title
      t.string :seo_description
      t.datetime :published_at
      t.boolean :draft, default: true
      t.string :slug

      t.timestamps
    end
  end
end
