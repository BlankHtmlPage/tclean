#!/data/data/com.termux/files/usr/bin/bash
# filename: tclean.sh
# Termux Deep Cleaner
# Version: 1.0.0

# --- COLORS ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- UTILS ---
log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

# --- START ---
echo -e "${GREEN}🚀 Starting Termux Deep Clean...${NC}"

# 1. APT CLEANUP
log "🧹 Cleaning APT cache..."
apt-get clean
success "APT cache cleared."

log "📦 Removing unused dependencies (autoremove)..."
# -y to auto-confirm
apt-get autoremove -y > /dev/null 2>&1
success "Orphaned packages removed."

# 2. LANGUAGE PACKAGE MANAGERS
# Developers often lose GBs here. We check if tools exist before cleaning.

# Python (PIP)
if command -v pip &> /dev/null; then
    log "🐍 Cleaning PIP cache..."
    pip cache purge &> /dev/null
    success "PIP cache purged."
fi

# Node.js (NPM)
if command -v npm &> /dev/null; then
    log "📦 Cleaning NPM cache..."
    npm cache clean --force &> /dev/null
    success "NPM cache cleared."
fi

# Yarn
if command -v yarn &> /dev/null; then
    log "🧶 Cleaning Yarn cache..."
    echo y || yarn cache clean &> /dev/null
    success "Yarn cache cleared."
fi

# Go (Golang)
if command -v go &> /dev/null; then
    log "🐹 Cleaning Go mod cache..."
    go clean -modcache
    success "Go cache cleared."
fi

# 3. SYSTEM & USER CACHE
log "🗑️ Cleaning temporary files..."
rm -rf "$PREFIX/tmp/*"
rm -rf "$PREFIX/var/log/*"

# ~/.cache is where most Linux tools store temp data (ccache, fontconfig, etc)
USER_CACHE="$HOME/.cache"
if [ -d "$USER_CACHE" ]; then
    log "🗄️ Cleaning user ~/.cache directory..."
    # We remove contents, not the dir itself to preserve structure if needed
    rm -rf "$USER_CACHE"/*
    success "User cache emptied."
fi

# 4. CCACHE (Compiler Cache)
# If user compiles C/C++ often
if command -v ccache &> /dev/null; then
    log "⚙️ Clearing compiler cache (ccache)..."
    ccache -C > /dev/null
    success "Compiler cache cleared."
fi

# 5. THUMBNAILS (Video/Image processing tools)
if [ -d "$HOME/.thumbnails" ]; then
    rm -rf "$HOME/.thumbnails"
fi

# --- FINISH ---
echo "---------------------------------------------------"
echo -e "${GREEN}✅ Termux Cleanup Completed!${NC}"
