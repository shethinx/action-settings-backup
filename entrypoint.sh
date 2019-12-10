#!/bin/sh

theme configure --password=$SHOPIFY_PASSWORD --store=$SHOPIFY_STORE_URL --themeid=$SHOPIFY_THEME_ID --dir=$THEME_PATH $INPUT_ARGS
theme download config/settings_data.json config/settings_schema.json
timestamp=$(date +%d-%m-%Y-%H:%M:%S)
mv config/settings_data.json settings_data_$timestamp.json
mv config/settings_schema.json settings_schema_$timestamp.json

cat ./settings_data_$timestamp.json
cat ./settings_schema_$timestamp.json


# cp to AWS