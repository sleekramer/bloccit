include RandomData

# Create Posts
50.times do

  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

#Create comments
100.times do
  Comment.create(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

 Post.find_or_create_by(title: "Unique Post") do |post|
   post.body = "This post should only be added to the database one time."
 end
 Comment.find_or_create_by(
    body: "This is a unique comment. It will only be added once",
    post: Post.find(101)
  )
