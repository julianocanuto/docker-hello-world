# Smallest Docker Hello World image

The goal of this project is to create the smallest possible Docker image that prints a message to the terminal. To achieve this, we use the minimal scratch image and build statically compiled files in Go, C, and Assembly. This README will guide you through the steps to compile the code for each language and build the Docker images.

## Project Structure

The project is organized into three directories:
- `go/`: Contains the Go implementation.
- `c/`: Contains the C implementation.
- `asm/`: Contains the Assembly implementation.

Each folder has its own Dockerfile and source code.

## Steps to Compile and Build the Docker Images
### 1. Go Implementation
#### Compile the Go Code

To compile the Go code into a statically linked binary:

```bash
cd go

GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main .
```

This command builds the binary ```main``` that will be copied into the ```scratch``` image.

#### Build and Run the Docker Image

Build the Docker image:

```bash
docker build -t my-hello-world-go .
```

Run the container:

```bash
docker run my-hello-world-go
```

Expected output:

```bash
Juliano Canuto - Dev Full Cycle
```

### 2. C Implementation
In this implementation, we use musl-gcc to compile the C program, which allows us to produce a smaller, statically linked binary.

#### Compile the C Code
To compile the C code into a statically linked binary using musl-gcc, run the following commands:

```bash
musl-gcc -static -Os -o myapp myapp.c
```

```bash
strip myapp
```

- static: Statically links the binary, so it does not rely on shared libraries.
- Os: Optimizes the binary for size.
- strip: Removes all unnecessary symbols, reducing the binary size further.

This produces a minimal binary ``myapp`` that will be included in the ``scratch`` image.

#### Build and Run the Docker Image

Build the Docker image:
```bash
docker build -t my-hello-world-c .
```

Run the container:
```bash
docker run my-hello-world-c
```

Expected output:
```bash
Juliano Canuto - Dev Full Cycle
```

### 3. Assembly Implementation
Assemble and Link the Code
To create the statically linked binary from Assembly code:
```bash
nasm -f elf64 -o print.o print.s 
```

```bash
ld -o print print.o
```

```bash
strip print
```

This creates the binary ``print`` that will be used in the scratch image.

#### Build and Run the Docker Image
Build the Docker image:
```bash
docker build -t my-hello-world-asm .
```

Run the container:
```bash
docker run my-hello-world-asm
```

Expected output:
```bash
Juliano Canuto - Dev Full Cycle
```

# Conclusion

This project demonstrates how to create the smallest possible Docker images using ``Go``, ``C``, and ``Assembly``. By leveraging the ``scratch`` image and statically compiling the binaries, we achieve minimal image sizes that serve the simple purpose of printing a message to the terminal.