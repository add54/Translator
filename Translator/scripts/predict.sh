#!/usr/bin/env bash

DATASET=Multi30k
TRAIN=../data/${DATASET}/Training/
TEST=../data/${DATASET}/Testing/

cd src
source bin/activate

echo "Predicting text with trained model"

python3.7 predict.py \
    en ../models/${DATASET}/vocab.english.gz \
    ../models/${DATASET}/vocab.french.gz \
    ../models/${DATASET}/model_e2f_w_att_gru.pt \
    --source-word-embedding-size 256 \
    --target-word-embedding-size 256 \
    --encoder-num-layers 3 \
    --encoder-num-attention-heads 8 \
    --encoder-pf-size 512 \
    --encoder-dropout 0.1 \
    --decoder-num-layers 3 \
    --decoder-num-attention-heads 8 \
    --decoder-pf-size 512 \
    --decoder-dropout 0.1 \
    --device cpu \
    --batch-size 32 \
    --input-text the \

echo "Finished training"