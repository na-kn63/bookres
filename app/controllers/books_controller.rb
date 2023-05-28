class BooksController < ApplicationController
  def new
    @books =Book.new
  end
  #以下を追加
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end
  end

  def index
    @books=Book.all
    @book=Book.new

  end


  def show
    @book = Book.find(params[:id])

  end
def edit
    @book= Book.find(params[:id])
  
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  else
    render :edit
  end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    flash[:notice] = "Book was successfully updated."
      book.destroy  # データ（レコード）を削除
        redirect_to books_path #投稿一覧画面へリダイレクト
  end

  private
  def book_params
     params.require(:book).permit(:title, :body)
  end

end