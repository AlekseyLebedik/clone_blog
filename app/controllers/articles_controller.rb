class ArticlesController < ApplicationController

    before_action :search_article , :articles_params
    
    def index
        @articl = Article.all()
        @last  = Article.last

    end
    
    
    def create 
        
        arctical = Article.create(articles_params)

        if arctical.persisted?
           redirect_to articles_path
        else
            render body:   arctical.errors.first
        end
    end 
    
    def update
        Article.where(id: params[:id]).update(articles_params)
        redirect_to articles_path
    end

    def show
        unless (@article = Article.where(id: params[:id]).first)
            render body: 'Page not found ' , status: 404
        end
    end
    def edit
        @article = Article.where(id: params[:id]).first    
    end


    def new
           
    end
        
    def destroy 
        destroyer = Article.where(id: params[:id]).first.destroy
        
        if destroyer.destroyed?
            redirect_to articles_path
        else
            render  body: 'Erorrs'
        end 
    end



    private
    def articles_params
        params.permit(:title , :author , :description , :avatar)
    end
    
    def search_article
        @articl = Article.where(id: params[:id])
    end
end
