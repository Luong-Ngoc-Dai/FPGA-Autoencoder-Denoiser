# FPGA Autoencoder Denoiser

Hardware acceleration of a Convolutional Denoising Autoencoder for image denoising on FPGA.

## Overview

This project implements a Convolutional Denoising Autoencoder (DAE) to remove Gaussian noise from MNIST images and explores its hardware acceleration using Vitis HLS and Vivado.

The project covers the workflow from neural network training to hardware implementation:

Python Training → Weight Export → C++/Fixed-point → Vitis HLS → Vivado → FPGA

## Models

Two Autoencoder architectures were implemented and evaluated:

- Small Autoencoder
- Optimized Autoencoder with Batch Normalization

The models were trained using TensorFlow/Keras with Gaussian noise (σ = 0.5).

## Hardware Implementation

The trained model weights were exported from TensorFlow/Keras to C/C++ header files and used in a C++ inference implementation.

Vitis HLS was used to synthesize the C++ implementation into hardware, with fixed-point arithmetic applied to reduce hardware resource requirements.

The generated hardware design was further integrated and evaluated using Vivado.

## Verification

The HLS implementation was verified against the original Python model.

The verification flow compares:

- Noisy input image
- Python model output (golden reference)
- C++/HLS output
- Original clean image

MSE (Mean Squared Error) and PSNR (Peak Signal-to-Noise Ratio) were used to evaluate denoising quality and verify the consistency between the software and hardware implementations.

## Technologies

- Python
- TensorFlow / Keras
- NumPy
- C/C++
- Vitis HLS
- Vivado
- FPGA
- Fixed-point Arithmetic
- CNN / Autoencoder
- MNIST

## Repository Structure

```text
├── model_training/       # Model training and training results
├── model_result/         # Trained models and evaluation results
├── VITIS_HLS/            # C++ implementation and Vitis HLS project
├── vivado_autoencoder/   # Vivado hardware project
├── *.py                  # Data preparation and weight conversion scripts
└── reports/              # Project documentation
