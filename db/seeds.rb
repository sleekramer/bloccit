include RandomData

# Create Ratings
pg = Rating.create!(severity: 'PG')
pg_13 = Rating.create!(severity: 'PG13')
r = Rating.create!(severity: 'R')
ratings = Rating.all
# Create Users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all
#Create Topics
15.times do
  Topic.create!(
    rating: ratings.sample,
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all
# Create Posts
50.times do
  Post.create!(
    rating: ratings.sample,
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

#Create comments
100.times do
  Comment.create(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
admin = User.create!(
  name: "Admin User",
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)
member = User.create!(
  name: "Member User",
  email: 'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{Rating.count} ratings created"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
