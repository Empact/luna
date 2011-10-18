class Groups::QuestionsController < ApplicationController
  filter_resource_access nested_in: :groups

  def new
  end

  def create
    @question.created_by = current_user
    if @question.save
      redirect_to group_question_path(@group, @question)
    else
      render :new
    end
  end

  def show
  end
end
