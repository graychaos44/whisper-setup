#!/bin/bash
# Whisper.cpp upgrade script
# Checks for new model versions and updates

set -e

MODEL_DIR="$HOME/scripts"
MODEL_FILE="$MODEL_DIR/ggml-large-v3-turbo.bin"
REPO_URL="https://github.com/ggerganov/whisper.cpp"

echo "=== Whisper.cpp Upgrade Check ==="

# Update Homebrew
echo "Checking for whisper-cpp updates..."
brew upgrade whisper-cpp 2>/dev/null || echo "Already up to date"

# Check model version
echo ""
echo "Current model: $(du -h "$MODEL_FILE" 2>/dev/null | cut -f1 || echo 'not found')"
echo "Model path: $MODEL_FILE"
echo ""
echo "To update model, re-download from:"
echo "  $REPO_URL"
echo ""
echo "Available models:"
echo "  tiny:     75MB    - Fast, low accuracy"
echo "  base:     142MB   - Fast, decent"
echo "  small:    466MB   - Balanced"
echo "  medium:   1.5GB   - Good accuracy"
echo "  large-v3-turbo: 1.5GB - Fast + very good (recommended)"
echo "  large-v3: 3.1GB  - Best accuracy, slower"
echo ""
echo "Current version: $(whisper-cli --version 2>&1 | head -1 || echo 'unknown')"
