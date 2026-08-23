package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "🚀 Multi-Stage Build: Ultra-Lightweight Production Container Running Successfully!\n")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("Server starting on port 8080...")
    http.ListenAndServe(":8080", nil)
}
