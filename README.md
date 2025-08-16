
# GitHub Repository Terraform Template

このリポジトリは、Terraform を用いて GitHub リポジトリとそのルールセットを自動作成するためのテンプレートです。

## 構成ファイル

- `src/main.tf`
	- GitHubリポジトリ（`github_repository`）の作成
	- ブランチ保護ルール（`github_repository_ruleset`）の設定

- `src/variables.tf`
	- `owner`: リポジトリのオーナー（デフォルト: `Mkamono`）
	- `repository`: 作成するリポジトリ名
	- `visibility`: リポジトリの公開範囲（`public`, `private`, `internal` のいずれか）


## 使い方


### 1. 初期セットアップ

以下のコマンドで初期化・認証・Terraform初期化をまとめて実行できます。
このコマンド実行時に `mise.local.template.toml` が `mise.local.toml` に自動コピーされます。

```bash
mise run init
```



### 2. Plan（リポジトリ作成内容の確認）

`mise run init` 実行後、`mise.local.toml` をエディタで開き、必要な環境変数（`REPOSITORY` や `VISIBILITY` など）を編集してください。

```bash
# mise.local.toml をエディタで開き、REPOSITORY や VISIBILITY を設定
mise run plan
```


### 3. Apply（リポジトリ作成の実行）

```bash
mise run apply
```

---


## 注意事項

- `VISIBILITY` には `public`, `private`, `internal` のいずれかを指定してください。
- `REPOSITORY` には作成したいリポジトリ名を指定してください。
- ブランチ保護ルールは `main` ブランチに対して適用されます。


---
