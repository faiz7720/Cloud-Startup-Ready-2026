const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;
const MONGO_URI = process.env.MONGO_URI || 'mongodb://db:27017/devops_db';

app.use(cors());
app.use(express.json());

// MongoDB connection
mongoose.connect(MONGO_URI)
  .then(() => console.log(' Connected to MongoDB Production Database'))
  .catch(err => console.error(' MongoDB Connection Error:', err));

// Schema definition
const LogSchema = new mongoose.Schema({
  message: String,
  timestamp: { type: Date, default: Date.now }
});
const Log = mongoose.model('Log', LogSchema);

// API Routes
app.get('/api/health', (req, res) => {
  res.json({
    status: 'Healthy',
    service: 'Backend Microservice Tier',
    uptime: process.uptime(),
    db_state: mongoose.connection.readyState === 1 ? 'Connected' : 'Disconnected'
  });
});

app.post('/api/logs', async (req, res) => {
  try {
    const entry = new Log({ message: req.body.message || 'Heartbeat Ping' });
    await entry.save();
    res.status(201).json({ success: true, saved: entry });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

app.get('/api/logs', async (req, res) => {
  try {
    const logs = await Log.find().sort({ timestamp: -1 }).limit(5);
    res.json({ success: true, logs });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(` Backend Service running on port ${PORT}`);
});
