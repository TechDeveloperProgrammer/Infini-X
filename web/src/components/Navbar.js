
import React from 'react';
import { AppBar, Toolbar, Typography, Button, Box } from '@mui/material';
import { Link } from 'react-router-dom';

function Navbar() {
  return (
    <AppBar position="static">
      <Toolbar>
        <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
          Infini-X
        </Typography>
        <Box>
          <Button color="inherit" component={Link} to="/">
            Dashboard
          </Button>
          <Button color="inherit" component={Link} to="/users">
            Users
          </Button>
          <Button color="inherit" component={Link} to="/devices">
            Devices
          </Button>
          <Button color="inherit" component={Link} to="/ai">
            AI
          </Button>
        </Box>
      </Toolbar>
    </AppBar>
  );
}

export default Navbar;
