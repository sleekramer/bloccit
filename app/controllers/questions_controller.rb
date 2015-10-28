class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = false

    if @question.save
      flash[:notice] = "Question asked."
      redirect_to @question
    else
      flash[:error] = "There was an error asking the question. Please try again."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]
    if @question.save
      flash[:notice] = "Question updated."
      redirect_to @question
    else
      flash[:error] = "There was an error editing the question. Please try again."
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "Question deleted"
      redirect_to(questions_path)
    else
      flash[:error] = "There was an error deleting question. Please try again."
      render :show
    end
  end
end
