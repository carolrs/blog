require_relative 'comments'
require_relative 'database_connection'

class CommentRepository

  def all 
    sql = 'SELECT * FROM comments;'
    result_set = DatabaseConnection.exec_params(sql, [])
    comments = []
  
    result_set.each do |row|
      comment = Comments.new
      comment.id = row['id']
      comment.comment = row['comments']
      comment.post_id = row['post_id']
      comment.author = row['author']
  
      comments << comment
    end
    comments
    end

  def write(comment)
    sql = 'INSERT INTO comments(comments, post_id, author) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [comment.comment, comment.post_id, comment.author])

  end

end