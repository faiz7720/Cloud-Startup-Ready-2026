# 🚀 Multi-Tier Cloud-Ready Microservices Fleet Architecture

An enterprise-grade, production-orchestrated microservices architecture running across multi-container Docker environments with dynamic reverse-proxy routing and localized container networking.

---

## 🏛️ System Architecture

```text
[ Client Browser ]
        │
   (Port 80 HTTP)
        ▼
┌──────────────────────────────────────────────┐
│       Nginx API Gateway (Reverse Proxy)      │
└──────────────┬───────────────────────────────┘
               │
      ┌────────┴────────┐
      │ (Path Routing)  │
      ▼                 ▼
┌──────────────┐  ┌────────────────────────────┐
│ React Client │  │     Node.js / Express      │
│  (Port 80)   │  │       Backend API          │
└──────────────┘  └─────────────┬──────────────┘
                                │
                       (Internal Fleet Net)
                                ▼
                  ┌───────────────────────────┐
                  │    MongoDB Database       │
                  │       (Port 27017)        │
                  └───────────────────────────┘
