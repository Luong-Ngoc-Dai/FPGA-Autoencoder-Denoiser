// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdenoiser_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDenoiser_top_CfgInitialize(XDenoiser_top *InstancePtr, XDenoiser_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDenoiser_top_Start(XDenoiser_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDenoiser_top_IsDone(XDenoiser_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDenoiser_top_IsIdle(XDenoiser_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDenoiser_top_IsReady(XDenoiser_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDenoiser_top_EnableAutoRestart(XDenoiser_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDenoiser_top_DisableAutoRestart(XDenoiser_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_AP_CTRL, 0);
}

void XDenoiser_top_Set_input_r(XDenoiser_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XDenoiser_top_Get_input_r(XDenoiser_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

void XDenoiser_top_Set_output_r(XDenoiser_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_OUTPUT_R_DATA, (u32)(Data));
    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_OUTPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XDenoiser_top_Get_output_r(XDenoiser_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_OUTPUT_R_DATA);
    Data += (u64)XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_OUTPUT_R_DATA + 4) << 32;
    return Data;
}

void XDenoiser_top_InterruptGlobalEnable(XDenoiser_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_GIE, 1);
}

void XDenoiser_top_InterruptGlobalDisable(XDenoiser_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_GIE, 0);
}

void XDenoiser_top_InterruptEnable(XDenoiser_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_IER);
    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_IER, Register | Mask);
}

void XDenoiser_top_InterruptDisable(XDenoiser_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_IER);
    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDenoiser_top_InterruptClear(XDenoiser_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDenoiser_top_WriteReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_ISR, Mask);
}

u32 XDenoiser_top_InterruptGetEnabled(XDenoiser_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_IER);
}

u32 XDenoiser_top_InterruptGetStatus(XDenoiser_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDenoiser_top_ReadReg(InstancePtr->Control_BaseAddress, XDENOISER_TOP_CONTROL_ADDR_ISR);
}

