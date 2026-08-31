// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDENOISER_TOP_H
#define XDENOISER_TOP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdenoiser_top_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XDenoiser_top_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDenoiser_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDenoiser_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDenoiser_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDenoiser_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDenoiser_top_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XDenoiser_top_Initialize(XDenoiser_top *InstancePtr, u16 DeviceId);
XDenoiser_top_Config* XDenoiser_top_LookupConfig(u16 DeviceId);
int XDenoiser_top_CfgInitialize(XDenoiser_top *InstancePtr, XDenoiser_top_Config *ConfigPtr);
#else
int XDenoiser_top_Initialize(XDenoiser_top *InstancePtr, const char* InstanceName);
int XDenoiser_top_Release(XDenoiser_top *InstancePtr);
#endif

void XDenoiser_top_Start(XDenoiser_top *InstancePtr);
u32 XDenoiser_top_IsDone(XDenoiser_top *InstancePtr);
u32 XDenoiser_top_IsIdle(XDenoiser_top *InstancePtr);
u32 XDenoiser_top_IsReady(XDenoiser_top *InstancePtr);
void XDenoiser_top_EnableAutoRestart(XDenoiser_top *InstancePtr);
void XDenoiser_top_DisableAutoRestart(XDenoiser_top *InstancePtr);

void XDenoiser_top_Set_input_r(XDenoiser_top *InstancePtr, u64 Data);
u64 XDenoiser_top_Get_input_r(XDenoiser_top *InstancePtr);
void XDenoiser_top_Set_output_r(XDenoiser_top *InstancePtr, u64 Data);
u64 XDenoiser_top_Get_output_r(XDenoiser_top *InstancePtr);

void XDenoiser_top_InterruptGlobalEnable(XDenoiser_top *InstancePtr);
void XDenoiser_top_InterruptGlobalDisable(XDenoiser_top *InstancePtr);
void XDenoiser_top_InterruptEnable(XDenoiser_top *InstancePtr, u32 Mask);
void XDenoiser_top_InterruptDisable(XDenoiser_top *InstancePtr, u32 Mask);
void XDenoiser_top_InterruptClear(XDenoiser_top *InstancePtr, u32 Mask);
u32 XDenoiser_top_InterruptGetEnabled(XDenoiser_top *InstancePtr);
u32 XDenoiser_top_InterruptGetStatus(XDenoiser_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
