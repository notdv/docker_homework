#!/bin/sh

echo "Client running..."
echo "Hello from client!" | nc server-container 80
