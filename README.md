# Project Documentation

---

# 📁 Folder Structure Overview

```
main/
├── project/                # Camera Vision Project (incomplete - simulation OK)
├── Hello/                  # UART Communication and Fall Detection Project (complete)
├── train/
│   └── train_logistic_regression.py
├── Demo M5StickC UART/
│   ├── platformio.ini
│   └── src/
│       └── main.cpp
```


---

# 1. Camera Vision Project (Incomplete)

**Branch:** `main/project`

### Overview
This project implements a simple **camera-based object tracking system** using an **OV7670** camera and displaying output on a **VGA monitor**.

- ❌ Project is incomplete because of pinout issues in the `.xdc` constraint file that blocked bitstream generation.
- ✅ Full simulations run successfully.

### How It Works

- **Camera Interface:**
  - Captures pixel data, vsync, href from the OV7670 camera and outputs pixel stream and frame addresses.

- **Frame Buffer (BRAM):**
  - Stores pixel data in memory for processing while new data is being written.

- **Feature Extraction:**
  - Simple module (e.g., edge detection or keypoint extraction) is applied to buffered pixel data.

- **Template Matching:**
  - Compares extracted features to a predefined pattern (`TEMPLATE_PATTERN`) for object/pattern detection.

- **VGA Controller:**
  - Displays raw camera images or processed images with overlayed matching results.

- **Timing Synchronization:**
  - Separate processes align VGA signals properly for a stable display output.

📌 **Note:** Hardware upload failed, but camera input, frame buffering, feature extraction, and template matching simulation results are correct.

> **Location:** `main/project/`

---

# 2. UART Communication and Fall Detection Project (Complete)

**Branch:** `main/Hello`

### Overview
This project implements **IMU data monitoring** via **UART communication** between an **M5StickC** and an **FPGA**.

- ✅ Fully working project.
- ✅ Bitstream successfully generated and tested on hardware.

### How It Works

- **M5StickC:**
  - Reads IMU (accelerometer) data.
  - Sends data over UART to FPGA.

- **UART Receiver (uart_rx) on FPGA:**
  - Receives scaled IMU data.

- **Data Parsing:**
  - Parses ASCII UART data into integer values representing acceleration (scaled by 0.1g).

- **Threshold-Based Detection:**
  - **Safe:** IMU acceleration between 0.7g and 1.3g.
  - **Fall Detected:** IMU acceleration < 0.7g or > 1.3g.

- **Machine Learning (Logistic Regression):**
  - A trained Logistic Regression model (from Python scikit-learn) is integrated for smarter fall detection.

- **LED Display:**
  - IMU values are visualized on onboard LEDs for debugging.

- **UART Transmitter (uart_tx):**
  - FPGA sends a response back:
    - `'K'` = Safe state
    - `'A'` = Alert (fall detected)
    - `'I'` = Invalid input

> **Location:** `main/Hello/`

---

# 3. main/train (Python Logistic Regression Training)

Python script for training a **Logistic Regression** model for the fall detection system.

### Details:
- Dataset split:
  - **9288 samples** for training.
  - **3955 samples** for testing.
- Workflow:
  - Load feature and label data.
  - Train the Logistic Regression model.
  - Evaluate on test set.
  - Save the trained model using `joblib`.

### Requirements:
- `scikit-learn`
- `numpy`
- `joblib`

> **Location:** `main/train/train_logistic_regression.py`

---

# 4. main/Demo M5StickC UART (PlatformIO)

Embedded C++ project for **M5StickC** that communicates over UART and displays incoming messages.

### Details:
- Developed using **PlatformIO**.
- Sets up **Serial** communication at **115200 baud rate**.
- Displays UART-received messages on M5StickC's screen.

### Requirements:
- PlatformIO
- M5StickC Arduino libraries
- ESP32 platform setup

> **Location:** `main/Demo M5StickC UART/`

---

# 📋 Repository Summary

This repository includes:

- 📷 Camera Vision Project (simulation OK, hardware incomplete)
- 🦽 UART-based IMU Monitoring and Fall Detection (working)
- 🧠 Python Training Script (Logistic Regression for fall detection)
- 📟 M5StickC UART Communication Demo (embedded C++)

---

# 🛠️ Tools & Environment

- **FPGA Board:** Nexys A7 100T
- **IDE:** Vivado 2024.2
- **Language:** VHDL (for FPGA logic), C++ (for M5StickC), Python (for ML model)
- **External Hardware:** M5StickC (with IMU sensor)
- **Communication:** UART (115200 baud)

---

