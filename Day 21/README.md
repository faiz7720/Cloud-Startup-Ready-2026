# Day 21: Production Observability & Monitoring

Deployed a production-grade observability and telemetry pipeline on AWS EC2 to monitor host and container metrics.

## Architecture & Components
- **Node Exporter**: Collects hardware, CPU, memory, and disk telemetry from the Linux host.
- **Prometheus**: Time-series database scraping target metrics via container bridge network (`172.17.0.1:9100`) at 5s intervals.
- **Grafana**: Real-time telemetry dashboard (Dashboard ID: 1860).

## Telemetry Validation
- Simulated multi-core CPU load tests using zero-disk streaming workloads.
- Verified real-time usage spikes and scraping responsiveness on Grafana dashboard.

## How to Run
```bash
cd monitoring
docker compose up -d
