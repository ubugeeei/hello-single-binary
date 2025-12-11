.PHONY: all clean size
.PHONY: build-go build-go-direct build-bun build-bun-direct build-rust build-rust-direct build-c build-c-direct build-deno build-deno-direct build-d build-d-direct
.PHONY: run-go run-go-direct run-bun run-bun-direct run-rust run-rust-direct run-c run-c-direct run-deno run-deno-direct run-d run-d-direct

all: build-go build-go-direct build-bun build-bun-direct build-rust build-rust-direct build-c build-c-direct build-deno build-deno-direct build-d build-d-direct

build-go:
	cd go && go build -o hello main.go

build-go-direct:
	cd go && go build -o hello-direct direct-stdout.go

build-bun:
	cd bun && bun build --compile main.ts --outfile hello

build-bun-direct:
	cd bun && bun build --compile direct-stdout.ts --outfile hello-direct

build-rust:
	cd rust && rustc -o hello main.rs

build-rust-direct:
	cd rust && rustc -o hello-direct direct-stdout.rs

build-c:
	cd c && cc -o hello main.c

build-c-direct:
	cd c && cc -o hello-direct direct-stdout.c

build-deno:
	cd deno && deno compile -o hello main.ts

build-deno-direct:
	cd deno && deno compile -o hello-direct direct-stdout.ts

build-d:
	cd d && ldc2 -of=hello main.d

build-d-direct:
	cd d && ldc2 -of=hello-direct direct-stdout.d

clean:
	rm -f go/hello go/hello-direct bun/hello bun/hello-direct rust/hello rust/hello-direct c/hello c/hello-direct deno/hello deno/hello-direct d/hello d/hello-direct

run-go: build-go
	./go/hello

run-go-direct: build-go-direct
	./go/hello-direct

run-bun: build-bun
	./bun/hello

run-bun-direct: build-bun-direct
	./bun/hello-direct

run-rust: build-rust
	./rust/hello

run-rust-direct: build-rust-direct
	./rust/hello-direct

run-c: build-c
	./c/hello

run-c-direct: build-c-direct
	./c/hello-direct

run-deno: build-deno
	./deno/hello

run-deno-direct: build-deno-direct
	./deno/hello-direct

run-d: build-d
	./d/hello

run-d-direct: build-d-direct
	./d/hello-direct

size: all
	@echo "=== Binary Size Comparison ==="
	@printf "Go:          " && ls -lh go/hello | awk '{print $$5}'
	@printf "Go(direct):  " && ls -lh go/hello-direct | awk '{print $$5}'
	@printf "Bun:         " && ls -lh bun/hello | awk '{print $$5}'
	@printf "Bun(direct): " && ls -lh bun/hello-direct | awk '{print $$5}'
	@printf "Rust:        " && ls -lh rust/hello | awk '{print $$5}'
	@printf "Rust(direct):" && ls -lh rust/hello-direct | awk '{print $$5}'
	@printf "C:           " && ls -lh c/hello | awk '{print $$5}'
	@printf "C(direct):   " && ls -lh c/hello-direct | awk '{print $$5}'
	@printf "Deno:        " && ls -lh deno/hello | awk '{print $$5}'
	@printf "Deno(direct):" && ls -lh deno/hello-direct | awk '{print $$5}'
	@printf "D:           " && ls -lh d/hello | awk '{print $$5}'
	@printf "D:           " && ls -lh d/hello-direct | awk '{print $$5}'
