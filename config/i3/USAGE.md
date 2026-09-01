# i3wm 使用速查表

对应配置文件:同目录下 `config`。`Mod` = Super/Win 键,`Alt` = Mod1。

## 终端
| 按键 | 功能 |
|---|---|
| `Mod+Enter` | 打开 alacritty |
| `Mod+'` | 在当前目录打开 alacritty |
| `Mod+u` | 水平分割后开终端 |
| `Mod+y` | 同上(当前目录) |
| `Mod+i` / `Mod+o` | 垂直分割(当前目录为 `o`) |
| `Mod+Ctrl+Enter` 等 | 同上,但启动 `zsh-vim`(VIM 版终端) |

## 启动程序
| 按键 | 功能 |
|---|---|
| `Mod+g` | rofi 应用启动器 |
| `Mod+Shift+g` | rofimoji 表情 |
| `Mod+Alt+1/2/3/5` | chromium / firefox / Idea / spotify |
| `Mod+Alt+6` | rofi 计算器 |
| `Mod+Alt+9` | pavucontrol |

## 窗口焦点与移动(Vim 键位)
| 按键 | 功能 |
|---|---|
| `Mod+h/j/k/l` | 焦点 左/下/上/右 |
| `Mod+Shift+h/j/k/l` | 移动窗口 |
| `Mod+Ctrl+Alt+h/l/j/k` | 拆分并合并窗口(左右 / 上下拼接) |
| `Mod+a` / `Mod+d` | 聚焦父 / 子容器 |
| `Mod+q` | 优雅关闭窗口(自定义脚本) |

## 布局
| 按键 | 功能 |
|---|---|
| `Mod+z` / `Mod+v` | 水平 / 垂直分割 |
| `Mod+w` / `Mod+e` | tabbed 布局 / 切换 split 布局 |
| `Mod+f` | 全屏切换 |
| `Mod+s` | sticky(跨工作区)切换 |
| `Mod+Space` | 焦点切换 tiling / floating |
| `Mod+Shift+Space` | 窗口浮动 / 平铺切换 |
| `Mod+r` | 进入调整大小模式(`h/j/k/l` 调整,`Esc` / `Enter` / `Mod+r` 退出) |

## 工作区
| 按键 | 功能 |
|---|---|
| `Mod+1..0` | 切换到工作区 1-10 |
| `Mod+Shift+1..0` | 移动窗口到工作区 |
| `Mod+Ctrl+h/l` | 上一个 / 下一个工作区 |
| `Mod+Ctrl+Shift+h/l` | 移动窗口到上 / 下个工作区 |
| `Mod+Ctrl+n` | 新建工作区 |
| `Mod+Alt+h/l/k/j` | 移动当前工作区到 左/右/上/下 显示器 |
| `Mod+Alt+Shift+h/l/k/j` | 同上(配置里两组命令实际相同) |

## 系统与电源
`Mod+Shift+Esc` 打开系统菜单:

| 按键 | 功能 |
|---|---|
| `l` | 锁屏 |
| `e` | 注销 |
| `x` | 挂起 |
| `s` | 挂起并锁屏 |
| `r` | 重启 |
| `h` | 关机 |

## 媒体与系统控制
| 按键 | 功能 |
|---|---|
| `XF86AudioRaiseVolume` / `Mod+Alt+equal` | 音量 +5% |
| `XF86AudioLowerVolume` / `Mod+Alt+minus` | 音量 -5% |
| `XF86AudioMute` / `Mod+Alt+0` | 静音切换 |
| `XF86MonBrightnessDown/Up` | 屏幕亮度(需 sudo) |

## 截图与其他
| 按键 | 功能 |
|---|---|
| `Mod+Home` | 全屏截图到 /tmp |
| `Mod+Shift+Home` | 选区截图 |
| `Mod+Alt+Home` | 录屏当前窗口 |
| `Mod+x` | kmag 放大镜 |
| `Mod+minus` / `Mod+Shift+minus` | 显示 / 隐藏 scratchpad |
| `Mod+grave`(`` ` ``) | 切换键盘布局 |
| `Mod+Ctrl+m` | 鼠标移到屏幕角落 |
| `Mod+Shift+c` | reload 配置 |
| `Mod+Shift+r` | restart i3(保留布局会话) |
| `Mod+Shift+q` | 退出 i3 |