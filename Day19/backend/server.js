const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const MONGO_URI = process.env.MONGO_URI || 'mongodb://production_db:27017/microservices_db';

mongoose.connect(MONGO_URI)
  .then(() => console.log('Connected to MongoDB Production Instance'))
  .catch(err => console.error('MongoDB Connection Error:', err));

const transactionSchema = new mongoose.Schema({
  id: String,
  user: String,
  amount: Number,
  status: String,
  timestamp: { type: Date, default: Date.now }
});

const Transaction = mongoose.model('Transaction', transactionSchema);

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'Healthy',
    service: 'Backend Microservice Tier',
    uptime: process.uptime(),
    db_state: mongoose.connection.readyState === 1 ? 'Connected' : 'Disconnected'
  });
});

app.get('/api/transactions', async (req, res) => {
  try {
    const data = await Transaction.find({}, { _id: 0, __v: 0 });
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, '0.0.0.0', () => console.log(`Backend running on port ${PORT}`));
