# 进入「改得动」阶段，确认 vim 9.2 剪贴板新 API

用户的使命从「用得顺」扩展到「改得动」（三阶段快捷键已学完，总复习无卡壳）。第一个待修项是 vim 系统剪贴板（`空格+y/p` 失效）。

关键非显然教训：用户的 vim 是 9.2，剪贴板 provider 用的是**新 API**——`v:clipproviders` 字典 + `clipmethod` 选项 + 函数式 callback（`available`/`copy`/`paste`），而非 vim 8 时代网上流传的 `g:clipboard`（shell 命令字符串）写法。已实测验证新写法 copy/paste 双向可用（xclip，X11 环境，`DISPLAY=:0`）。

**Implications**: 后续「改得动」课程必须优先查本机 vim 实际版本与 `:help` 文档，不能套网上旧教程。剪贴板已备好正确配置（lesson 0022），待用户亲手写入 `.vimrc` 验证。剩余待修项：toilet 字体、fzf 接入、clipcopy 函数、rofi-calc。
