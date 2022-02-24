#!/bin/bash

echo "Downloading CODEC (Documents Corpus) -> SAMPLE..."
wget https://codec-public-data.s3.amazonaws.com/sample_codec_documents.jsonl -P "./data/doc_corpus"

echo "Downloading KILT (Entity KB) -> SAMPLE..."
wget https://codec-public-data.s3.amazonaws.com/sample_kilt_knowledgesource.json -P "./data"

echo "Downloading Entity Links (Docs -> Ents) -> SAMPLE..."
wget https://codec-public-data.s3.amazonaws.com/sample_comets_entity_link.jsonl -P "./data"