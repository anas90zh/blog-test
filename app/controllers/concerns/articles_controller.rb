class  ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end



    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
        flash[:notice] = "Arricle was created"
        redirect_to article_path(@article)
        else
            render 'new'

        end

    end
    def show
        @article = Article.find(params[:id])
        
    end


    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = " article is deleted"
        redirect_to articles_path

    end

    def edit 
        @article = Article.find(params[:id])

    end


    def update
        @article = Article.find(params[:id])
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

        


end
