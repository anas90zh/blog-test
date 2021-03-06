class  ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy] 

    def index
        @articles = Article.all
    end



    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
        flash[:notice] = "Arricle was created"
        redirect_to article_path(@article)
        else
            render 'new'

        end

    end
    def show
        
    end


    def destroy
        @article.destroy
        flash[:notice] = " article is deleted"
        redirect_to articles_path

    end

    def edit 

    end


    def update
        if @article.update(article_params)
            flash[:notice] = "Arricle was deleted"
            redirect_to articles_path
        else 
            render 'edit'
        end

    end

 



    #wight listing
    private
        def article_params
            params.require(:article).permit(:title, :descrition)

        end

        def set_article
            @article = Article.find(params[:id])

        end


end
