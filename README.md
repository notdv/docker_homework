# Docker Alpine-Netcat Client-Server Setup

This project demonstrates a simple client-server communication using two Alpine-based Docker containers running `netcat`. The client container sends a message to the server container, and the server listens for and displays that message.

## Prerequisites

- Docker installed on your machine.

## Instructions

1. **Build Docker Images**

   First, build the Docker image using the provided `Dockerfile`:

   ```bash
   docker build -t alpine-netcat-sample .
   ```

2. **Create a Custom Docker Network**

   Create a bridge network to allow communication between the client and server containers:

   ```bash
   docker network create netcat-network
   ```

3. **Run the Containers**

    You will need to run the server and client in separate containers.

    Run the Server: In one terminal window, start the server container, which will listen for incoming messages:

    ```bash
    docker run -it --rm --name server-container --network netcat-network alpine-netcat-sample sh ./server_script.sh
    ```

    Run the Client: In a different terminal window, run the client container, which will send a message to the server:
    
    ```bash
    docker run -it --rm --name client-container --network netcat-network alpine-netcat-sample sh ./client_script.sh
    ```
    
    The client will send the message `"Hello from client!"` to the server on port `80`.

4. **Verify Connectivity**

    You can verify that the containers can communicate with each other by using `ping`:

    ```bash
    docker exec -it client-container ping server-container
    ```
    
    ```bash
    docker exec -it server-container ping client-container
    ```
    Also once the client sends the message, the server should display:
    
    ```bash
    Hello from client!
    ```

