class CreateUrlShorteners < ActiveRecord::Migration[5.2]
  def change
    create_table :url_shorteners do |t|
      t.string :ori_url
      t.string :short_url

      t.timestamps
    end
  end
end
