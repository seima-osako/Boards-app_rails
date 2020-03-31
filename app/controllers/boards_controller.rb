class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
  
  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
  end

  private
  # paramsデータの中でどのキーの値を取得するかフィルターをかける
  # 意図していないデータを混ぜてpostされた場合に丸ごと保存するとセキュリティリスクになる

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end