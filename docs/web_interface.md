
# Web Interface

This section provides an overview of the Infini-X web interface, a React-based application designed for graphical management and interaction with the Infini-X system.

## Overview

The web interface aims to provide a user-friendly graphical front-end for various Infini-X functionalities, including:

-   **System Dashboard**: An overview of system status and key metrics.
-   **User Management**: Create, edit, and manage users.
-   **Device Management**: Monitor connected devices and trigger actions like GSI flashing.
-   **AI Interaction**: A graphical interface for interacting with offline AI models (speech-to-text, text-to-speech, voice conversion).
-   **Configuration Management**: (Future) A UI for managing various Infini-X configurations.

## Technology Stack

-   **Frontend Framework**: React (JavaScript/TypeScript)
-   **UI Library**: Material UI (MUI) for Material Design principles and components.
-   **Styling**: Bootstrap CSS for responsive design and utility classes.
-   **Routing**: React Router for client-side navigation.
-   **State Management**: React Context API (conceptual, can be extended to Redux for larger applications).
-   **Build Tool**: Create React App (via `react-scripts`)

## Structure (`web/`)

-   **`public/`**: Contains static assets like `index.html` (the entry point for the web application), `favicon.ico`, and `manifest.json`.
-   **`src/`**: The main source code directory for the React application.
    -   **`src/index.js`**: The primary entry point that renders the root React component.
    -   **`src/App.js`**: The main application component, responsible for setting up routing and global theme providers.
    -   **`src/components/`**: Houses reusable UI components (e.g., `Navbar.js` for navigation).
    -   **`src/pages/`**: Contains the different views or pages of the application:
        -   `Dashboard.js`: Provides an overview of the system.
        -   `Users.js`: Interface for user management.
        -   `Devices.js`: Interface for managing connected devices.
        -   `AI.js`: Interface for interacting with the offline AI models.
    -   **`src/services/`**: Contains client-side services for making API calls to the backend (conceptual `api.js`).
    -   **`src/context/`**: Provides React Context for global state management (e.g., `AppContext.js` for theme toggling).
-   **`package.json`**: Defines project metadata, scripts, and dependencies for the Node.js ecosystem.

## Getting Started

To run the Infini-X web interface locally:

1.  **Navigate to the `web/` directory**:
    ```bash
    cd web
    ```

2.  **Install Node.js Dependencies**:
    ```bash
npm install
    # or yarn install
    ```

3.  **Start the Development Server**:
    ```bash
npm start
    # or yarn start
    ```
    This will typically open the application in your default web browser at `http://localhost:3000`.

4.  **Build for Production**:
    ```bash
npm run build
    # or yarn build
    ```
    This command compiles the React application into static files, which will be placed in the `build/` directory, ready for deployment to a web server.

## Integration with Core Services

The web interface is designed to interact with the `core/` services (written in Go) through a conceptual API. The `src/services/api.js` file provides placeholder functions for making these API calls. In a real implementation, these would be replaced with actual HTTP requests to a backend server exposing the `core/` functionalities.

## Further Development

-   **Backend Integration**: Implement a full-fledged backend (e.g., using Go with `core/` services) to expose RESTful APIs for the web interface.
-   **Authentication and Authorization**: Implement user login, session management, and role-based access control.
-   **Real-time Updates**: Use WebSockets or Server-Sent Events for real-time updates from the backend (e.g., device status changes, AI processing progress).
-   **Advanced UI/UX**: Enhance the user interface with more interactive components, data visualizations, and a polished user experience.
-   **Testing**: Implement comprehensive unit, integration, and end-to-end tests for the React application.
