#!/bin/bash

echo "Downloading CODEC (Documents Corpus) from IR-datasets or Huggingface"

echo "Downloading KILT (Entity KB)..."
wget  wget http://dl.fbaipublicfiles.com/KILT/kilt_knowledgesource.json -P "./data"

