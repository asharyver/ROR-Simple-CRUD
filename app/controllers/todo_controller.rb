class TodoController < ApplicationController
  def index
    @todo = Todo.all
    render json: @todo
  end

  def create
    res = Todo.create(name: params[:name])
    render json: { res: res.valid?, msg: res.errors.messages }
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.name = params[:name]
    render json: { res: todo.save, msg: todo.errors.messages }
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    render json: { res: true }
  end
end
