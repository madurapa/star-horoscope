#!/usr/bin/env python3
"""
STAR - Sri Lankan Vedic Astrology Engine
Phase 5: CLI Wrapper using working binary as engine
"""

import argparse
import subprocess
import json
import sys
import os
from pathlib import Path
import configparser
import tempfile

def find_binary():
    """Find the working binary"""
    possible_paths = [
        Path(__file__).parent / "build" / "test_ephemeris",
        Path("/tmp/test_ephem"),
    ]
    for p in possible_paths:
        if Path(p).exists():
            return Path(p)
    return None

def load_config(config_path):
    """Load configuration from INI file"""
    config = configparser.ConfigParser()
    config.read(config_path)
    return config

def parse_config_file(config_path):
    """Parse simple key=value config file"""
    config = {}
    with open(config_path, 'r') as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#') or line.startswith(';'):
                continue
            if '=' in line:
                key, value = line.split('=', 1)
                config[key.strip()] = value.strip()
    return config

def main():
    parser = argparse.ArgumentParser(
        description="STAR - Sri Lankan Vedic Astrology Engine",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  star                    # Run baseline computation
  star --verify           # Verify against ground truth screens
  star --config config.ini  # Load configuration from file
        """
    )
    parser.add_argument("--verify", action="store_true", help="Run verification mode")
    parser.add_argument("--config", type=str, help="Config file path (INI format)")
    parser.add_argument("--output-file", type=str, help="Output file")
    parser.add_argument("--format", choices=["text", "json", "csv"], default="text", help="Output format")
    parser.add_argument("--name", default="Test Owner")
    parser.add_argument("--year", type=int, default=1981)
    parser.add_argument("--month", type=int, default=12)
    parser.add_argument("--day", type=int, default=8)
    parser.add_argument("--hour", type=int, default=12)
    parser.add_argument("--minute", type=int, default=55)
    parser.add_argument("--city", type=int, default=7)
    parser.add_argument("--nirayana", action="store_true")
    parser.add_argument("--screen", type=int, help="Specific screen 1-19")
    args = parser.parse_args()

    # Load config file if provided
    if args.config:
        config = parse_config_file(args.config)
        for key, value in vars(args).items():
            if key in config and getattr(args, key) == parser.get_default(key):
                setattr(args, key, config[key])

    # Find binary
    possible_paths = [
        Path(__file__).parent / "build" / "test_ephemeris",
        Path("/tmp/test_ephem"),
    ]

    binary_path = None
    for p in possible_paths:
        if Path(p).exists():
            binary_path = Path(p)
            break

    if not binary_path:
        # Try to build
        print("Building STAR engine...")
        result = subprocess.run([
            "g++", "-std=c++2a", "-O2",
            "-Isrc",
            "tests/test_ephemeris.cpp",
            "src/VargaEngine.cpp",
            "-o", "/tmp/test_ephem"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent))
        if result.returncode != 0:
            print("Compilation failed:")
            print(result.stderr)
            return 1
        binary_path = Path("/tmp/test_ephem")

    if not Path(binary_path).exists():
        print("Error: Working binary not found. Please compile test_ephemeris first.")
        sys.exit(1)

    if args.verify:
        print("Verification mode not yet implemented")
        return 1

    # Prepare environment
    env = os.environ.copy()
    env["STAR_NAME"] = args.name
    env["STAR_YEAR"] = str(args.year)
    env["STAR_MONTH"] = str(args.month)
    env["STAR_DAY"] = str(args.day)
    env["STAR_HOUR"] = str(args.hour)
    env["STAR_MINUTE"] = str(args.minute)
    env["STAR_CITY"] = str(args.city)
    env["STAR_NIRAYANA"] = "1" if args.nirayana else "0"
    if args.screen:
        env["STAR_SCREEN"] = str(args.screen)

    # Run the binary
    result = subprocess.run([str(binary_path)], capture_output=True, text=True, env=env)
    output = result.stdout

    # Format output
    if args.output_format == "json":
        # Parse the output and convert to JSON
        output = json.dumps({"output": output.strip()}, indent=2)
    elif args.output_format == "csv":
        # Simple CSV conversion
        lines = output.strip().split('\n')
        output = "\n".join([f'"{line}"' for line in lines])
    else:
        output = result.stdout

    if args.output:
        with open(args.output, 'w') as f:
            f.write(output)
    else:
        print(output)

    return 0

if __name__ == "__main__":
    sys.exit(main())