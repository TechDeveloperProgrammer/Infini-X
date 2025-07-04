
import React from 'react';
import { Container, Typography, Box, List, ListItem, ListItemText } from '@mui/material';

function Devices() {
  // Conceptual device data
  const devices = [
    { id: 1, name: 'Android Phone', type: 'Mobile', status: 'Connected' },
    { id: 2, name: 'Virtual Machine', type: 'VM', status: 'Running' },
  ];

  return (
    <Container maxWidth="md" sx={{ mt: 4 }}>
      <Typography variant="h4" component="h1" gutterBottom>
        Device Management
      </Typography>
      <Box sx={{ my: 2 }}>
        <Typography variant="body1">
          Manage connected devices and their status.
        </Typography>
        <List>
          {devices.map((device) => (
            <ListItem key={device.id}>
              <ListItemText primary={device.name} secondary={`${device.type} - ${device.status}`} />
            </ListItem>
          ))}
        </List>
        {/* Add device actions (e.g., flash GSI) here */}
      </Box>
    </Container>
  );
}

export default Devices;
