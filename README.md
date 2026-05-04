# Whisper.cpp Setup

macOS용 Whisper.cpp + large-v3-turbo 모델 설치 스크립트

## 설치
```bash
./install.sh
```

## 업그레이드
```bash
./upgrade.sh
```

## 사용법
```bash
whisper-cli -m ~/scripts/ggml-large-v3-turbo.bin -l ko -f audio.wav
```

## 모델 비교
| 모델 | 크기 | 속도 | 정확도 |
|------|------|------|--------|
| tiny | 75MB | 매우 빠름 | 낮음 |
| base | 142MB | 빠름 | 보통 |
| small | 466MB | 보통 | 좋음 |
| medium | 1.5GB | 느림 | 매우 좋음 |
| large-v3-turbo | 1.5GB | 빠름 | 매우 좋음 |
| large-v3 | 3.1GB | 느림 | 최고 |

## 요구사항
- macOS (Apple Silicon 권장)
- Homebrew
- 1.5GB+ 디스크 공간
