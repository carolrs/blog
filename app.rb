# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/comments_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('blog')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT * FROM posts;'
result = DatabaseConnection.exec_params(sql, [])

post_repo = PostRepository.new
comment_repo = CommentRepository.new

# Print out each record from the result set .
post_repo.all.each do |post|
  puts  "Post: #{post.title}:  #{post.content}"
end

puts "########################"

comment_repo.all.each do |comment|
  puts  "Comments: #{comment.comment}: #{comment.post_id}, Author: #{comment.author}"
end