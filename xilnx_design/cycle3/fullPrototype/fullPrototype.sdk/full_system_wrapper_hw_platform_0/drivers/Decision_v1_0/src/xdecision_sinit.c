// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdecision.h"

extern XDecision_Config XDecision_ConfigTable[];

XDecision_Config *XDecision_LookupConfig(u16 DeviceId) {
	XDecision_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDECISION_NUM_INSTANCES; Index++) {
		if (XDecision_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDecision_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDecision_Initialize(XDecision *InstancePtr, u16 DeviceId) {
	XDecision_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDecision_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDecision_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

