#/bin/bash

source $(pwd)/func/install_editable_repo.sh

install_editable_repo jampy_cli
install_editable_repo jampy_util_common
install_editable_repo swift llm
install_editable_repo swift_workspace

pip install accelerate
pip install bitsandbytes

# Check if nvcc is installed
if ! command -v nvcc &> /dev/null
then
    echo ">>> nvcc (CUDA compiler) is not installed"
    exit 1
fi

echo ">>> Installing PyTorch with CUDA support..."
cuda_version=$(nvcc --version | grep "release" | awk '{print $6}' | cut -c2-)
echo "CUDA version: $cuda_version"
if [[ $cuda_version == 12* ]]; then
    pip3 install torch torchvision torchaudio
else
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
fi



echo ">>> Installing flash-attn..."
pip install ninja # 加速 flash_attn 编译, 和CPU核数有关

# 可选版本号：https://github.com/Dao-AILab/flash-attention/releases?page=2
export http_proxy=127.0.0.1:7890
export http_proxy=127.0.0.1:7891
pip install flash-attn==2.5.8 \
    --no-build-isolation \
    --verbos