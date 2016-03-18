class PlayersController < ApplicationController
    
    def show
        @user=User.find( params[:id])
    end
    
    #Create a new Player. If you already have a game it will overwrite it.
    def create
        @user = User.find( params[:user_id] )
        @game = @user.game
        
        @player = @game.players.build(player_params)
        if @player.save
          flash[:success] = "Player Created!"
          redirect_to user_path( params[:user_id] )
        else
          render action: :new
        end
    end
    
    def new
        # form for user to create game details
        @user = User.find( params[:user_id] )
        @player = Player.new
        
    end

    private
    # You need to sanitize all the params you are passing from your create form
        def player_params
          params.require(:player).permit(:player_name, :player_code, :balance)
        end

end

