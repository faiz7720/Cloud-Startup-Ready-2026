package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"time"
)

type HealthResponse struct {
	Status          string `json:"status"`
	Service         string `json:"service"`
	Environment     string `json:"environment"`
	ContainerEngine string `json:"container_engine"`
	DeployedAt      string `json:"deployed_at"`
	Architecture    string `json:"architecture"`
	Documentation   string `json:"documentation"`
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	response := HealthResponse{
		Status:          "HEALTHY",
		Service:         "production-go-microservice",
		Environment:     "aws-ec2-production",
		ContainerEngine: "docker-multi-stage",
		DeployedAt:      time.Now().Format(time.RFC1123),
		Architecture:    "x86_64 Alpine Minimal Scratch",
		Documentation:   "Production CI/CD Automated via GitHub Actions",
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(response)
}

func main() {
	http.HandleFunc("/", healthHandler)
	fmt.Println("Server running on port 8080...")
	http.ListenAndServe(":8080", nil)
}
