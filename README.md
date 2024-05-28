### 博客创作助手与管理平台

**博客创作助手与管理平台**是一个帮助博主进行博客创作、发布与管理的工具。它可以提供一个用户友好的界面，帮助用户高效地创建和编辑博客文章，并提供管理功能，如分类、查找、评论等。

### 文件说明

前端项目文件：UI

后端项目文件：server

数据库：Mydata.sql

### 前端运行

终端运行安装命令：

```
npm install --legacy-peer-deps
```

构建：

```
npm run build
```

启动服务：

```
npm run serve
```

### 后端运行

使用IDEA打开项目，配置好本地的maven。

依次运行：

```
maven clean
maven install
```

待依赖安装完成后，运行DemoApplication.java即可。

**注意**：需要将自己的chatgpt的apiKey填入WebSocketServer.java中，否则可能会运行出错。