#!/bin/bash
cargo run --bin q16-asm -- test.asm
cargo run --bin q16-ld -- test.bin test.o
cargo run --bin q16-emu -- test.bin
