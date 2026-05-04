#!/bin/bash
# Whisper.cpp + large-v3-turbo model installer for macOS
# Usage: ./install.sh

set -e

MODEL_DIR="$HOME/scripts"
MODEL_URL="https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo.bin"
MODEL_FILE="$MODEL_DIR/ggml-large-v3-turbo.bin"

echo "=== Whisper.cpp Installer ==="

# Install whisper-cpp via Homebrew
if ! command -v whisper-cli &>/dev/null; then
    echo "Installing whisper-cpp via Homebrew..."
    brew install whisper-cpp
else
    echo "whisper-cpp already installed: $(whisper-cli --help 2>&1 | head -1 || echo 'ok')"
fi

# Download model
if [ -f "$MODEL_FILE" ]; then
    echo "Model already exists: $MODEL_FILE"
    echo "Size: $(du -h "$MODEL_FILE" | cut -f1)"
else
    echo "Downloading large-v3-turbo model (1.5GB)..."
    mkdir -p "$MODEL_DIR"
    curl -L -o "$MODEL_FILE" "$MODEL_URL"
    echo "Download complete: $MODEL_FILE"
fi

# Verify
echo ""
echo "=== Installation Complete ==="
echo "Model: $MODEL_FILE"
echo "CLI: whisper-cli -m $MODEL_FILE -l ko -f <audio_file>"
echo ""
echo "Quick test:"
echo "  whisper-cli -m $MODEL_FILE -l ko -t 8 --no-timestamps -f <audio.wav>"
