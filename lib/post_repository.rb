require_relative 'post'
require_relative 'database_connection'

class PostRepository

  def all 
    sql = 'SELECT * FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    posts = []
  
    result_set.each do |row|
      post = Post.new
      post.id = row['id']
      post.title = row['title']
      post.content = row['content']
  
      posts << post
    end
    posts
    end

  def write(post)
    sql = 'INSERT INTO posts(title, content) VALUES ($1, $2);'
    DatabaseConnection.exec_params(sql, [post.title, post.content])

  end

  def delete(id)
    sql = 'DELETE from posts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])

  end
end