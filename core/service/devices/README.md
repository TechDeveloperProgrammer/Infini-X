
# Infini-X Core - Device Service

This directory defines the service responsible for managing and interacting with connected devices within the Infini-X ecosystem. This includes functionalities related to Android GSI flashing, container management, and general device information retrieval.

## Purpose
- **Device Discovery**: Identifies and lists connected devices.
- **Device Management**: Provides operations for interacting with devices (e.g., flashing, rebooting).
- **Abstraction**: Abstracts away the complexities of device-specific protocols (e.g., ADB, Fastboot).

## Structure (Conceptual)
- `devices.go`: Contains functions for listing devices, flashing GSIs, and other device-related operations.
- `models.go`: Data structures representing devices and their properties.
- `drivers/`: Subdirectory for device-specific drivers or integration logic (e.g., `adb.go`, `fastboot.go`).

## Usage
Other core services or external applications (e.g., `web/`) can use this service to manage devices. For example, the web interface could call `ListDevices` to display connected devices and `FlashGSI` to initiate a ROM flash.

## Further Development
- Implement actual device discovery and interaction using native Go libraries or by executing external tools (e.g., `adb`, `fastboot`).
- Add support for more device types (e.g., IoT devices, other mobile platforms).
- Implement real-time device status updates.
- Develop a robust error handling mechanism for device operations.
