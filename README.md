# derta

官方 mono_repo 工具，不是很符合 node 工程习惯。
所以尝试做一个 dart 工程中的 lerna。
将会融合部分 autod 功能 和 yarn 部分功能，并计划兼容 flutter。

## TodoList

- [x] 设计 package.yaml 配置文件
  - [ ] 根据 配置 生成 对应 pubspec.yaml 文件
    1. [ ] 可自定义 scripts
    1. [ ] deps devDeps 可不标注版本号，根据 repo 最新版本 确定 是否 更新到最新（like autod）
    1. [ ] 可自定义 registry
    1. [ ] 可自定义 dart_modules path, 可安装依赖到 项目内
