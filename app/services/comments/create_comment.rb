module Comments
  class CreateComment
    def initialize(params,user)
      @params = params
      @current_user = user
    end
    
    def call
      new_comment
      set_comment_owner
      set_commented_movie
      @comment.save
      create_comment_notification
    end
    
    private
    
    def set_commented_movie
      if @params[:movie_id].present?
        @comment.movie_id = @params[:movie_id]
      else
        @comment.movie_id = @params[:comment][:movie_id]
      end
    end
    
    def set_comment_owner
      @comment.user_id = @current_user.id
    end
    
    def new_comment
      find_commentable
      @comment = Comment.new
      @comment = @commentable.comments.new @params
    end
    
    def find_commentable
      if @params[:commentable_id].present?
        @commentable = Comment.find_by_id(@params[:commentable_id])
      else
        @commentable = Movie.find_by_id(@params[:movie_id])
      end
    end 
    
    def create_comment_notification
      commented_id = @comment.commentable_id
      user_comments = Comment.where("user_id != ? ",@current_user.id).find_by_id(commented_id)
      
      if user_comments
        Notification.create(user_id: user_comments.user_id, comment_id: @comment.id, movie_id: @comment.movie_id, notification_type:"new comment", read: false)
      end
    end
  end
end