
#!/bin/bash

# piper_speak.sh - Text-to-Speech using Piper (Rust)

# Check for piper executable
if ! command -v piper &> /dev/null
then
    echo "Error: Piper executable not found. Please ensure Piper (Rust v0.11+) is installed and in your PATH."
    exit 1
fi

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 \"<text_to_speak>\" <output_audio.wav> <model_name>"
    echo "Example: $0 \"Hello, Infini-X!\" output.wav en_US-lessac-medium"
    exit 1
fi

TEXT="$1"
OUTPUT_FILE="$2"
MODEL_NAME="$3"

# Define base path for Piper models
PIPER_MODELS_BASE_DIR="$(dirname "$(realpath "$0")")"/models/piper

# Construct model and config paths based on model name
PIPER_MODEL="${PIPER_MODELS_BASE_DIR}/${MODEL_NAME}.onnx"
PIPER_CONFIG="${PIPER_MODELS_BASE_DIR}/${MODEL_NAME}.json"

if [ ! -f "$PIPER_MODEL" ]; then
    echo "Error: Piper model not found at $PIPER_MODEL."
    echo "Please download the .onnx model file for '$MODEL_NAME' and place it in ${PIPER_MODELS_BASE_DIR}."
    exit 1
fi

if [ ! -f "$PIPER_CONFIG" ]; then
    echo "Error: Piper config not found at $PIPER_CONFIG."
    echo "Please download the .json config file for '$MODEL_NAME' and place it in ${PIPER_MODELS_BASE_DIR}."
    exit 1
fi

echo "Generating speech for: \"$TEXT\" to $OUTPUT_FILE using model $MODEL_NAME"

piper --model "$PIPER_MODEL" --config "$PIPER_CONFIG" --output_file "$OUTPUT_FILE" --text "$TEXT"

if [ $? -eq 0 ]; then
    echo "Speech generation complete. Output saved to $OUTPUT_FILE"
else
    echo "Error: Speech generation failed."
fi
