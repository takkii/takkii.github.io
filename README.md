### takkii.github.io

GitHub page.

#### 環境構築

```markdown
gem install jekyll

rbenv rehash

jekyll new takkii.github.io
※ takkiiの部分はユーザ名

cd takkii.github.io

git init
... レポジトリ登録

jekyll s
jekyll build
... ローカル確認後、デフォルトブランチへ反映
```

#### Dcokerコンテナ環境構築

```markdown
docker-compose build

docker-compose up
```

#### Dockerfile

```markdown
ruby-2.7 ○ ( 起動 )
pathutil.rb:502: warning: Using the last argument as keyword parameters is deprecated

ruby-3.0 × ( 停止 )
pathutil.rb:502:in `read': no implicit conversion of Hash into Integer`

ruby-2.6 × ( 停止 )
Could not find commonmarker-0.17.13 in any of the sources (Bundler::GemNotFound)
```

[起動確認 -> localhost:4000](http://localhost:4000/)

#### 時刻を表示 : 2021-02-07 15:43:49 +0900
