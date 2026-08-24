const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const MONGO_URI = process.env.MONGO_URI || 'mongodb://db:27017/microservices_db';

mongoose.connect(MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('MongoDB Connected'))
  .catch(err => console.error(err));

const LogSchema = new mongoose.Schema({ message: String, timestamp: { type: Date, default: Date.now } });
const Log = mongoose.model('Log', LogSchema);

app.get('/api/status', (req, res) => {
  res.json({ status: 'Operational', tier: 'Backend API Microservice', database: 'Connected' });
});

app.post('/api/logs', async (req, res) => {
  const log = new Log({ message: req.body.message });
  await log.save();
  res.json({ success: true, saved: log });
});

app.get('/api/logs', async (req, res) => {
  const logs = await Log.find().sort({ timestamp: -1 });
  res.json({ success: true, logs });
});

app.listen(5000, () => console.log('Backend running on port 5000'));
