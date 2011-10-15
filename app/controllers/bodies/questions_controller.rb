class Bodies::QuestionsController < ApplicationController
  filter_resource_access nested_in: :bodies

  def new
  end

  def create
    if @question.save
      redirect_to body_question_path(@body, @question)
    else
      render :new
    end
  end

  def show
  end
end
