# node 镜像
# apline 版本的node会小很多
FROM node:12-alpine

# 在容器中创建目录
RUN mkdir -p /usr/src/app

# 指定工作空间，后面的指令都会在当前目录下执行
WORKDIR /usr/src/app

# 拷贝 package.json
COPY package.json /usr/src/app

# 安装依赖
RUN yarn 

# 拷贝其他所有文件到容器（除了 .dockerignore 中的目录和文件）
COPY . /usr/src/app

# build
RUN yarn run build

# 暴露端口 3000
EXPOSE 3000

# 运行容器时执行命令，每个 Dokcerfile 只能有一个 CMD 命令，多个的话只有最后一个会执行
CMD [ "yarn", "start" ]