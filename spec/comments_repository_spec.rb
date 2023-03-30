require 'comments_repository'

describe CommentRepository do

  def reset_comments_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_test' })
    connection.exec(seed_sql)
  end
  before(:each) do
    reset_comments_table()
  end

  it "return a new comment" do
    comment_repo = CommentRepository.new 
    comment = Comments.new
    comment.comment = "Indeed!!"
    comment.post_id = 2
    comment.author = 'Anne'
   
    comment_repo.write(comment)
    result = comment_repo.all[3]
    expect(result.comment).to eq "Indeed!!"
    expect(result.author).to eq "Anne"

  end
end