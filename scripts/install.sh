#!/bin/bash
# ========================================
# Dotfiles Installer
# Author: jiangtao
# For: Arch Linux
# Safe, Idempotent, and Production-Ready
# ========================================

# 启用严格模式：出错退出、未定义变量报错、管道错误检测
set -euo pipefail

# 颜色定义（用于输出）
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() { echo -e "${GREEN}✅ $1${NC}"; }
warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
error() { echo -e "${RED}❌ $1${NC}"; }
info() { echo -e "💡 $1"; }

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

echo "🚀 ${GREEN}Installing dotfiles from:${NC} $DOTFILES_DIR"
cd "$DOTFILES_DIR"

# ------------------------------------------------------------------
# 1. 检查并安装 stow
# ------------------------------------------------------------------
if ! command -v stow &> /dev/null; then
    info "stow not found. Installing stow..."
    if command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm stow && log "stow installed"
    else
        error "Unsupported OS: no pacman found. Please install 'stow' manually."
        exit 1
    fi
else
    log "stow is already installed"
fi

# ------------------------------------------------------------------
# 2. 检查并安装 oh-my-zsh
# ------------------------------------------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    info "oh-my-zsh not found. Installing..."
    if command -v curl &> /dev/null; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        log "oh-my-zsh installed"
    else
        error "curl not found. Please install curl or download install.sh manually."
        exit 1
    fi
else
    log "oh-my-zsh is already installed"
fi

# ------------------------------------------------------------------
# 3. 备份并链接 oh-my-zsh 自定义配置
# ------------------------------------------------------------------
OH_MY_ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
BACKUP_DIR="$HOME/.dotfiles-backup/oh-my-zsh-custom-$(date +%Y%m%d-%H%M%S)"

if [ -e "$OH_MY_ZSH_CUSTOM" ] && [ ! -L "$OH_MY_ZSH_CUSTOM" ]; then
    warn "Existing oh-my-zsh custom directory found (not a symlink): $OH_MY_ZSH_CUSTOM"
    info "Backing up to: $BACKUP_DIR"
    mkdir -p "$(dirname "$BACKUP_DIR")"
    mv "$OH_MY_ZSH_CUSTOM" "$BACKUP_DIR"
    log "Backup completed"
elif [ -L "$OH_MY_ZSH_CUSTOM" ]; then
    info "Existing symlink found, removing: $OH_MY_ZSH_CUSTOM"
    rm -f "$OH_MY_ZSH_CUSTOM"
else
    info "No existing oh-my-zsh custom found"
fi

info "Linking oh-my-zsh custom config..."
ln -sf "$DOTFILES_DIR/zsh/oh-my-zsh-custom/custom" "$OH_MY_ZSH_CUSTOM"
log "oh-my-zsh custom linked"

# ------------------------------------------------------------------
# 4. 使用 stow 链接所有模块（安全幂等）
# ------------------------------------------------------------------
declare -a MODULES=("zsh" "vim" "git")

for module in "${MODULES[@]}"; do
    if [ -d "$module" ]; then
        info "Stowing module: $module"
        if stow -v 1 --adopt -t "$HOME" "$module" 2>/dev/null || true; then
            # 如果 stow 失败（比如文件冲突），尝试先删除冲突
            stow -v 1 -D -t "$HOME" "$module" 2>/dev/null || true
            stow -v 1 -t "$HOME" "$module"
        fi
        log "Module $module installed"
    else
        warn "Module $module not found, skipping."
    fi
done

# ------------------------------------------------------------------
# 5. 设置 ~/bin 并链接脚本
# ------------------------------------------------------------------
BIN_DIR="$HOME/bin"
SCRIPTS_DIR="$DOTFILES_DIR/bin"

if [ ! -d "$BIN_DIR" ]; then
    info "Creating $BIN_DIR"
    mkdir -p "$BIN_DIR"
fi

if [ -d "$SCRIPTS_DIR" ]; then
    info "Linking scripts from $SCRIPTS_DIR to $BIN_DIR"
    for script in "$SCRIPTS_DIR"/*; do
        if [ -f "$script" ] || [ -x "$script" ]; then
            script_name=$(basename "$script")
            ln -sf "$script" "$BIN_DIR/$script_name"
        fi
    done
    log "All scripts linked to $BIN_DIR"
else
    warn "Scripts directory $SCRIPTS_DIR not found."
fi

# ------------------------------------------------------------------
# 6. 提示用户完成
# ------------------------------------------------------------------
echo ""
echo "🎉 ${GREEN}Dotfiles installed successfully!${NC}"
echo ""
info "Please restart your shell or run:"
echo "   exec zsh"
echo "   or open a new terminal."
echo ""
info "Backup location: $HOME/.dotfiles-backup/"
echo ""

# 检查 ~/bin 是否在 PATH 中
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    warn "⚠️  ~/bin is not in your PATH."
    info "Add this to your .zshrc:"
    echo 'export PATH="$HOME/bin:$PATH"'
fi
