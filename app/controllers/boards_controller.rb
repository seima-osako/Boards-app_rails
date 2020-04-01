class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards = Board.page(params[:page])
  end
  
  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      # idが付与されているため、そのURLにリダイレクトするように設定
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end
  
  def show
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
  end

  def update
    @board.update(board_params)

    redirect_to @board
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end

  private
  # paramsデータの中でどのキーの値を取得するかフィルターをかける
  # 意図していないデータを混ぜてpostされた場合に丸ごと保存するとセキュリティリスクになる

  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end

  # プライベートで設定する関数
  def set_target_board
    @board = Board.find(params[:id])
  end
end