# Tail-Light-Controller---Ford-Thunderbird

This project implements a Moore state machine in SystemVerilog to replicate the behavior of the 1965 Ford Thunderbird sequential tail lights. The design was simulated in ModelSim and deployed to a DigiLab FPGA, with full functionality for turn signals, brake lights, hazard lights, and running lights.

## 🚗 Features

- **Sequential Turn Signals**  
  Left/right lights blink in a 3-phase sequence based on turn signal input.

- **Brake Light Override**  
  All six lights turn on under braking; overridden appropriately by turn signals.

- **Hazard Lights**  
  All six lights flash in unison when hazards or both turn signals are active.

- **Running Lights**  
  Dimmed lights (50% brightness using 100Hz PWM) for nighttime visibility.

- **Signal Precedence Logic**  
  Inputs are prioritized in the following order: reset > brake > hazard > turn signals.

## 🧠 State Machine Design

- 8-state Moore FSM modeled using a `typedef enum` in SystemVerilog
- Inputs: `left_i`, `right_i`, `hazard_i`
- Outputs: `pattern_o` driving LED behavior
- Hazard and override logic handled with clean, modular structure

## 🛠 Tools & Tech Stack

- **Language**: SystemVerilog
- **Simulation**: ModelSim
- **Deployment**: Digilab FPGA
- **Hardware**:  
  - 6 Through-Hole LEDs  
  - 10-input DIP switch  
  - Breadboard, resistors, BNC cables  
  - Function generator (1Hz & 100Hz square waves)

## ✅ Validation

- Simulated full system with waveform verification
- Functional FPGA implementation and physical demo
- Extensive testbench coverage for all state transitions
