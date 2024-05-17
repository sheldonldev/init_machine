#!/bin/bash

echo_package() {
    keyword=$1

    echo ">>> $keyword"
    pip list | grep $keyword
    echo "---"
}

echo_package torch
echo_package transformers
echo_package flash_attn
echo_package xformers
echo_package vllm
