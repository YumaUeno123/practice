#!/bin/sh

# Go Modulesがダウンロードした依存ライブラリをコンテナのvolumeにマウントするのに使用する
export PRACTICE_GO_PATH=$(go env GOPATH)
