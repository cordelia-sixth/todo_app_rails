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

  # タスクを編集するページ
  # /tasks/:id/edit
  def edit
    @task = Task.find(params[:id])
  end

  # タスクを編集する
  def update
    # タスク編集ページに遷移する時に対象タスクのidをクエリパラメータで送信している
    # 送信されてきたidでタスクを取得
    @task = Task.find(params[:id])
    # 編集内容を取得してタスクを更新
    @task.update(task_params)
    # タスク一覧ページにリダイレクト
    redirect_to tasks_path
  end

  # タスクを削除する
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to(tasks_path)
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
