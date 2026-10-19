# MotoSystemsTask
Warwick Moto Control Systems and Modelling Technical Tasks

This repository contains my submission for the three Warwick Moto Control Systems & Modelling technical tasks: a MATLAB torque-speed envelope analysis, a Simulink ABS model, and a CAN DBC file for the BMS. All tasks were developed in **MATLAB / Simulink R2026b**.

Each task lives in its own folder and on its own branch.

## Task 1: MATLAB, Torque-Speed Envelope

Goal:Process real dyno data from the team and produce a torque-speed envelope showing the maximum measured torque across the tested speed range.

The script (TS_Env.m):
- Reads the provided dyno data ("Torque-Speed Envelope").
- Finds the maximum measured torque at each RPM.
- Plots RPM (x-axis) against maximum measured torque in Nm (y-axis).
- Characterises the envelope with separate linear relationships for the constant-torque region and the constant-power region.

Contains:
- `TS_Env.m`: the MATLAB script
- Torque data files required by the script

Required:
- MATLAB R2026b
- Data Acquisition Toolbox


## Task 2: Simulink, ABS Braking System

Goal: Create and simulate an anti-lock braking system (ABS) that regulates braking torque when excessive wheel slip is detected.
The equations, parameters and tyre data come from the provided Technical Reference document.

Plots produced:
- Vehicle speed
- Wheel speed
- Wheel slip
- Brake torque
- System state

Contains:
- `SLX_Banthia.slx`: the Simulink model
- A MATLAB script containing all variables and parameters used by the model
- All 5 plots generated from the Simulink Model

Required:
Run the MATLAB parameter script first. It loads the variables the model depends on into the workspace.


## Task 3: DBC Data Editing

Goal: Define the CAN messages sent from the Battery Management System (BMS) to the Vehicle Control Unit (VCU), using the provided signal definition table. The DBC file was created in Kvaser Database Editor 3.

Contains:
- `DBC_<LastName>.dbc`: the DBC file

Required:
Open the file in Kvaser Database Editor 3.


## Notes
- The Data Acquisition Toolbox is required for Task 1.
- The Task 2 parameter script must be run before the Simulink model.
- To get a single task, switch to its branch or open its folder on main.
Warwick Moto Control Systems and Modelling Technical Tasks
