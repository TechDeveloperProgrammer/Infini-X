import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Box, CssBaseline } from '@mui/material';
import { ThemeProvider, createTheme } from '@mui/material/styles';

import Navbar from './components/Navbar';
import Dashboard from './pages/Dashboard';
import Users from './pages/Users';
import Devices from './pages/Devices';
import AI from './pages/AI';
import { AppProvider } from './context/AppContext';

const darkTheme = createTheme({
  palette: {
    mode: 'dark',
    primary: {
      main: '#89b4fa', // Catppuccin Frappe Blue
    },
    background: {
      default: '#1e1e2e', // Catppuccin Frappe Base
      paper: '#313244', // Catppuccin Frappe Surface1
    },
    text: {
      primary: '#cdd6f4', // Catppuccin Frappe Text
      secondary: '#bac2de', // Catppuccin Frappe Subtext0
    },
  },
});

function App() {
  return (
    <AppProvider>
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <Router>
          <Navbar />
          <Box component="main" sx={{ p: 3 }}>
            <Routes>
              <Route path="/" element={<Dashboard />} />
              <Route path="/users" element={<Users />} />
              <Route path="/devices" element={<Devices />} />
              <Route path="/ai" element={<AI />} />
            </Routes>
          </Box>
        </Router>
      </ThemeProvider>
    </AppProvider>
  );
}

export default App;