# Mission: 把这套 dotfiles 的快捷操作用顺（i3 ✓ → zsh → vim）

## Why
我借用了一套现成的 dotfiles（含 i3wm、zsh、vim 配置），从"刚起步"开始学。目标是把这三个工具里已经配好的快捷键都用顺：脱离鼠标、不看速查表，日常操作凭肌肉记忆完成。

## Success looks like
- i3（已完成 5 课，进入间隔复习）：开终端、切焦点/工作区、分屏、布局、resize、rofi 兜底
- zsh（当前阶段）：不看表就用全局别名（`L`/`G`/`H`/`C` 等管道后缀）加速命令输入；用 bindkey 快捷键（`^K`/`^T`/`^G`）操作 shell
- vim（下一阶段）：核心命令 + `<leader>` 映射 + 常用插件

## Constraints
- 配置是借用的（Sebastian Daschner），不是自己写的——当前只学"用"，暂不深究"改"
- 目标是用得顺（肌肉记忆），不是改得动
- 学习以中文进行
- 偏好短课、每课一个可立即上手的收获

## Out of scope
- 修改/新增配置（bindsym、alias 等）——属于"改得动"，以后再学
- i3 进阶脚本（`_i3-graceful-kill` 等）的实现原理
- 从头学 shell 脚本语言——只学这套配置里已有的快捷操作
