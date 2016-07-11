# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# seed_file = File.join(Rails.root, 'db', 'seeds.yml')
# config = YAML::load_file(seed_file)

# Category.create(config["categories_list"])
# Publish.create(config["publishs_list"])
# Book.create(config["books_list"])
@category = []

12.times do
  category = FactoryGirl.build(:category)
  @category.push(Category.find_or_create_by(name: category.name).id)
end

10.times do
  publish = FactoryGirl.build(:publish)
  @publish = Publish.find_or_create_by(name: publish.name)
  @category.size.times do |index|
    book = FactoryGirl.build(:book)
    Book.create(category_id: @category[index],
                title: book.title,
                author: book.author,
                publish_id: @publish.id,
                cost: book.cost,
                sale: book.sale,
                photo: book.photo,
                content: book.content,
                weight: book.weight,
                size: book.size,
                pages: book.pages,
                date: book.date)
  end
end
