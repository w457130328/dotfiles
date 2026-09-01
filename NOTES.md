# Notes

- **语言**：用户用中文交流，所有 lesson / reference 用中文写。
- **起点**：借用（Sebastian Daschner）的 dotfiles，刚起步。用户已自己写了 `config/i3/USAGE.md` 中文速查表。
- **目标**：用得顺（肌肉记忆、不查表），不是改得动。优先技能练习（检索练习、间隔重复），少讲配置原理。
- **范围**：三阶段全部完成——i3（0001–0005）、zsh（0006–0009）、vim（0010–0020）、总复习（0021）。用户已把总复习页过一遍、无卡壳。
- **Lesson 节奏**：短、单一收获、有即时反馈循环（quiz / 实操步骤）。
- **系统差异（借来的配置 vs 实际安装）**：本轮已装：chromium、intellij-idea-ultimate-edition（付费版，用户明确要）、zip、mupdf、gpicview、vlc、libreoffice-fresh、spotify。故 `Mod+Alt+1`（chromium）、`Mod+Alt+3`（intellij）、`Mod+Alt+5`（spotify）现在应可用；后缀别名的图形打开类（`.pdf`/`.png`/`.mp4`/`.html`/办公文档）也已恢复。**仍失效待修（「改得动」清单）**：`clipcopy` 函数未加载（`C`/`CC`/`pwdc` 别名失效，oh-my-zsh 无此函数定义）；`rofi -show calc`（`Mod+Alt+6`）因 rofi-calc 未装、且 rofi 2.0 与 rofi-calc 兼容性存疑。**另发现**：`fzf` 已装（`/usr/bin/fzf`，含 `/usr/share/fzf/key-bindings.zsh`）但 `.zshrc` 未 source，故 `Ctrl+R` 仍是 zsh 原生历史搜索、非 fzf 模糊搜索——属可选的「改得动」项。`zsh-vim` 命令存在（`~/bin/zsh-vim` → 启动 zsh 后直接进 vim），故 `Mod+Ctrl+Return` 系列可用。

- **vim 的 `<S-Enter>` 映射失效**：`.vimrc` 里 `nmap <S-Enter> O<Esc>`（上方开新行）在终端 vim 里永远触发不了——终端（alacritty）把 Shift+Enter 和 Enter 当成同一个键发送（都是 `<CR>`），vim 无法区分。实际两者都走 `nmap <CR> o<Esc>`（下方开新行、停在 normal）。上方开新行需用 `O`。这是 Daschner 配置里另一个「只有 GUI vim 才生效」的映射。

- **vim 系统剪贴板失效**：当前 vim 是 `-clipboard`（`has('clipboard')=0`），只装了 `vim`/`vim-runtime`、无 gvim，故 `.vimrc` 里的 `空格+y`/`空格+p`/`空格+d`（`"+` 寄存器系统剪贴板）全部失效。但有 `+clipboard_provider` 且装了 `xclip`，之后配置 `g:clipboard` 即可救活（属「改得动」项）。

- **Alt+T 时间戳**：`shortcuts.zsh` 里是 `bindkey '^[^T'`，实际绑定的是「Esc 再 Ctrl+T」两步序列，不是 Alt+T（Alt+T 发送的是 `^[T`，仍挂着默认 transpose-words）。用户已确认**保留原样、不改配置**，用 Esc+Ctrl+T 记时间戳。课程 0007 与速查表已按此更正。

- **vim 空格+2/3 报错（toilet 字体缺失）**：`.vimrc` 第 161–162 行的 `空格+2`（`toilet -f standard`）和 `空格+3`（`toilet -f small`）在 Arch 上报 `error: could not load font`——toilet 只自带 `.tlf` 字体（mono12、smmono12、smblock、ascii12 等），没有 figlet 风格的 `standard`/`small` 这两个名字。`空格+1`（`-f term -F border`）正常，因为 `term` 是 toilet 内置默认字体。属「改得动」项：把字体名换成 mono12/ascii12（标准）、smmono12/smblock（小）即可。
