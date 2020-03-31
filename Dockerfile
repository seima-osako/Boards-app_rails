# リポジトリ:タグ
FROM ruby:2.4.5
# ruby2.4.5のイメージからコンテナを起動し、コンテナ内で実行するコマンドを定義, railsに必要なパッケージ
RUN apt-get update -qq && apt-get install -y build-essential nodejs
# appディレクトリにrailsプロジェクトを作成する
RUN mkdir /app
WORKDIR /app
# rubyのライブラリを管理するためのファイル
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
# Dockerfileの置いてあるフォルダ(余計なファイルは置かない)の内容を全てコンテナ内のappディレクトリにコピー
COPY . /app
