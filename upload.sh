#!/bin/bash

# 定义本地文件夹路径
local_folder="E:\Github Pages\filetest"

# 定义远程仓库URL
remote_url="https://github.com/sophon001/testrepository.git"

# 进入本地文件夹
cd "$local_folder"

# 检查本地是否已经存在Git仓库
if [ -d ".git" ]; then
    # 本地仓库已存在，跳过初始化
    echo "Local Git repository already exists."
else
    # 本地仓库不存在，初始化Git仓库
    git init
fi

# 检查是否有需要提交的更改
if git status | grep -q "Changes not staged for commit"; then
    # 有需要提交的更改，执行提交操作
    git add .
    git commit -m "Update files"
else
    # 没有需要提交的更改
    echo "No changes to commit."
fi

# 检查是否已经关联远程仓库
if ! git remote show | grep -q "origin"; then
    # 未关联远程仓库，添加远程仓库
    git remote add origin "$remote_url"
else
    # 已关联远程仓库，设置默认分支名为master（如果不是默认的master分支）
    git branch -M master
fi

# 尝试推送到GitHub远程仓库
if git push -u origin master; then
    echo "Push to GitHub successful."
else
    echo "Failed to push to GitHub."
fi
