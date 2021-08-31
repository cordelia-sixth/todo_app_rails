class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  # taskを新しく作成するページ
  def new
    @task = Task.new
  end

  # taskを作成する
  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
