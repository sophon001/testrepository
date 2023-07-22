#!/bin/bash

# 进入本地文件夹
cd "E:\Github Pages\filetest"

# 初始化本地仓库（如果尚未初始化）
git init

# 添加所有文件到Git暂存区
git add .

# 提交更改
git commit -m "Initial commit"

# 关联远程仓库
git remote add origin https://github.com/sophon001/testrepository.git

# 推送到GitHub远程仓库
git push -u origin master
