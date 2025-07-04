# Infini-X Core Logic

This directory contains the core business logic and fundamental components of the Infini-X project. It is designed to be platform-agnostic and reusable across different parts of the monorepo (e.g., web services, CLI tools, desktop applications).

## Purpose
- **Centralized Logic**: Houses the essential algorithms, data structures, and services that define Infini-X's primary functionalities.
- **Reusability**: Components here are built to be easily integrated and consumed by other modules within the monorepo.
- **Modularity**: Designed with clear interfaces to promote maintainability and testability.

## Structure
- `pkg/`: Contains Go packages for reusable libraries and common utilities.
  - `pkg/auth/`: Authentication and authorization logic.
  - `pkg/config/`: Configuration loading and management utilities.
  - `pkg/logger/`: Centralized logging utilities.
  - `pkg/utils/`: General utility functions.
- `service/`: Defines core services and their interfaces.
  - `service/users/`: User management service.
  - `service/devices/`: Device management service (e.g., for GSI flashing, container management).
  - `service/ai/`: Interface for interacting with offline AI models.
- `model/`: Data models and structures used across the core.
- `core.go`: Main entry point or initialization for the core module.
- `README.md`: This file.

## Example
Below is a simple Go placeholder file to illustrate the structure.

## Usage
Other modules in the monorepo should import packages from `core/` to leverage shared functionalities. For example, a web service in `web/` might import a user management package from `core/service/users` or a utility from `core/pkg/utils`.

## Further Development
- Implement actual core functionalities based on project requirements.
- Define clear API boundaries for each package/service.
- Write comprehensive unit and integration tests for all core components.
- Consider gRPC or other RPC frameworks for inter-service communication if services become distributed.