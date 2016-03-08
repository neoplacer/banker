class GamesController < ApplicationController

    def new
        # form for user to create game details
         @user = User.find( params[:user_id] )
        @game = @user.new
    end
    
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
    
    
    private
    # You need to sanitize all the params you are passing from your create form
        def game_params
          params.require(:game).permit(:gamename)
        end
    
    
end