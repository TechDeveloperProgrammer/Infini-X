
import React from 'react';
import { Container, Typography, Box } from '@mui/material';

function Dashboard() {
  return (
    <Container maxWidth="md" sx={{ mt: 4 }}>
      <Typography variant="h4" component="h1" gutterBottom>
        Dashboard
      </Typography>
      <Box sx={{ my: 2 }}>
        <Typography variant="body1">
          Welcome to the Infini-X Dashboard. Here you can get an overview of your system.
        </Typography>
        {/* Add more dashboard widgets/info here */}
      </Box>
    </Container>
  );
}

export default Dashboard;
