class GamesController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
    
    def show
        
    end
    
    def new
        # form for user to create game details
         @user = User.find( params[:user_id] )
        if @user.game
            redirect_to edit_user_game_path( params[:user_id])
        else
        @game = Game.new
        end
    end
    
    #Create a new game. If you already have a game it will overwrite it.
    def create
        @user = User.find( params[:user_id] )
        @game = @user.build_game(game_params)
        if @game.save
          flash[:success] = "Game Created!"
          redirect_to user_path( params[:user_id] )
        else
          render action: :new
        end
    end
    
    def edit
        @user = User.find( params[:user_id])
        @game = @user.game
    end
    
    def update
        @user = User.find( params[:user_id])
        @game = @user.game
        if @game.update_attributes(game_params)
            flash[:success] = "Game Updated!"
            redirect_to user_path(params[:user_id])
        else
            render action :edit
        end
        
    end
    
    def destroy
        @user = User.find( params[:user_id])
        @game = @user.game
        @game.destroy
        redirect_to user_path(params[:user_id])
    end
    
    private
    # You need to sanitize all the params you are passing from your create form
        def game_params
          params.require(:game).permit(:gamename)
        end
        def only_current_user
            @user = User.find( params[:user_id])
            redirect_to(root_url) unless @user == current_user
        end
    
    
end