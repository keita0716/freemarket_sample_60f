# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create(:id => row[0], 
                  :category_left_id => row[1], 
                  :category_left_name => row[2],
                  :category_center_id => row[3],
                  :category_center_name => row[4],
                  :category_right_id => row[5],
                  :category_right_name => row[6],
                  :item_id => row[7]
                )
end