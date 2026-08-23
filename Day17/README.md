# Day 17: Production-Grade Multi-Stage Docker Builds

## Overview
Demonstration of image optimization by decoupling the compiler/build environment from the final execution runtime.

## Comparative Metrics
| Metric | Single-Stage Build | Multi-Stage Build |
| :--- | :--- | :--- |
| **Base Image** | `golang:1.22` | `alpine:3.19` (via `golang:1.22-alpine` builder) |
| **Final Image Size** | 1.31 GB | 18.5 MB |
| **Footprint Reduction** | Baseline | **~98.5%** |
| **Runtime User** | `root` | `appuser (UID 1001)` |

## Key Technical Concepts
- **Static Compilation:** Used `CGO_ENABLED=0` to create a standalone binary without OS dependencies.
- **Binary Stripping:** Applied `-ldflags="-s -w"` to remove debug symbol tables.
- **Security Hardening:** Enforced rootless container execution.
