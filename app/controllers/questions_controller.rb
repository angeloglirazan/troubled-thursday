class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.where.not(:answer_id => nil).order(:created_at => :desc).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, notice: 'Thanks for asking a question! Expect an answer soon. :)'
    else
      render :new
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :author)
    end
end
