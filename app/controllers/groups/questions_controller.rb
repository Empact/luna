class Groups::QuestionsController < ApplicationController
  filter_resource_access nested_in: :groups

  def new
  end

  def create
    if @question.save
      redirect_to group_question_path(@group, @question)
    else
      render :new
    end
  end

  def show
  end
end
