class PagesController < ApplicationController
    
    def home
    end
    
    def about
    end
    
    def join
        @gamecode = params[:gamecode]
        @game = Game.find_by_entrycode(@gamecode)
        if @game
            @user_id = @game.user_id
            redirect_to(user_game_path(@user_id, entrycode: @gamecode))
        else
            flash[:danger] = "Game Does Not Exist"
            redirect_to(root_url)
        end
    end
end

private
    # def page_params
    #       params.require(:game).permit(:gamename, :entrycode)
    # end