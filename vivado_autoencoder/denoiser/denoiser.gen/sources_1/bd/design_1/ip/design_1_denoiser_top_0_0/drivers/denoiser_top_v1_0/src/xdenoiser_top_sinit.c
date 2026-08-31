// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdenoiser_top.h"

extern XDenoiser_top_Config XDenoiser_top_ConfigTable[];

XDenoiser_top_Config *XDenoiser_top_LookupConfig(u16 DeviceId) {
	XDenoiser_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDENOISER_TOP_NUM_INSTANCES; Index++) {
		if (XDenoiser_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDenoiser_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDenoiser_top_Initialize(XDenoiser_top *InstancePtr, u16 DeviceId) {
	XDenoiser_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDenoiser_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDenoiser_top_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

