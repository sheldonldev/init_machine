#!/bin/bash

if ! command -v nvidia-smi &>/dev/null; then
    echo "CUDA tookit not found!"
else
    echo ">>> CUDA tookit is available."
fi

if ! command -v nvcc &>/dev/null; then
    echo ">>> cuDNN not found!"
else
    nvcc --version
fi

if ! command -v conda &>/dev/null; then
    echo ">>> conda not found!"
else
    which conda
fi
