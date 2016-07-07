# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)

Category.create(config["categories_list"])
Publish.create(config["publishs_list"])
Book.create(config["books_list"])
# @category = Array.new

# 12.times do
#   category = FactoryGirl.build(:category)
#   if !Category.find_by_name(category.name)
#     @category.push(Category.create(:name => category.name).id)
#   end
# end

# i = 0
# 10.times do
#   publish = FactoryGirl.build(:publish)
#   if !Publish.find_by_name(publish.name)
#     @publish = Publish.create(:name => publish.name)
#     10.times do
#       i = 0 if i >= @category.size
#       book = FactoryGirl.build(:book)
#       Book.create(
#                 category_id: @category[i],
#                 title: book.title,
#                 author: book.author,
#                 publish_id: @publish.id,
#                 cost: book.cost,
#                 sale: book.sale,
#                 photo: book.photo,
#                 content: book.content,
#                 weight: book.weight,
#                 size: book.size,
#                 pages: book.pages,
#                 date: book.date
#             )
#       i = i+1
#     end
#   end
# end
