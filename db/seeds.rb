
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def seed_users
    user_id = 0 
    10.times do
        User.create(
            name: "test#{user_id}",
            email: "test#{user_id}@test.com",
            password: "123456",
            password_confirmation: "123456"
        )
        user_id = user_id + 1
    end
end 

def seed_categories
    hobby = ['Crafts', 'Basketball', 'Soccer', 'Photography', 'Hiking', 'Reading', 'Other']
    study = ['Visual Arts', 'Physics', 'Mathematics', 'Computer Science', 'Biology', 'Health Science', 'Business', 'Economics', 'Language', 'Other']
    team = ['Development', 'Focus', 'Play']

    hobby.each do |name|
        Category.create(branch: 'hobby', name: name)
    end 

    study.each do |name|
        Category.create(branch: 'study', name: name)
    end

    team.each do |name|
        Category.create(branch: 'study', name: name)
    end
end 

def seed_posts
    categories = Category.all

    categories.each do |category| 
        5.times do
            Post.create(
                title: Faker::Lorem.sentences[0],
                content: Faker::Lorem.sentences[0],
                user_id: rand(1..9),
                category_id: category.id
            )
        end
    end
end 

seed_users
seed_categories
seed_posts