class PagesController < ApplicationController
    
    def home
    end
    
    def about
    end
    
    def join
        @gamecode = params[:gamecode]
        @game = Game.find_by_entrycode(@gamecode)
        @user_id = @game.user_id
        redirect_to(user_game_path(@user_id, entrycode: @gamecode))
    end
end

private
    # def page_params
    #       params.require(:game).permit(:gamename, :entrycode)
    # end