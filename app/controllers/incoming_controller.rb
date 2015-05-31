class IncomingController < ActionController
    
    # Ignore authtication token for create action
    skip_before_action :verify_authenticity_token, only: [:create]
    
    def create
     
        @user = User.where(email: params['sender']).first
         
        if @user
            @topic = Topic.where(title: params[:subject]).first_or_create
            @topic.bookmarks.create(url: params["stripped-text"], user_id: @user.id)
        end
        
        # TO-DO: 1) Search body of email for url, 2) allow for multiple urls
        
        head 200
    end
end