#!/bin/sh

theme configure --password=$SHOPIFY_PASSWORD --store=$SHOPIFY_STORE_URL --themeid=$SHOPIFY_THEME_ID --dir=$THEME_PATH $INPUT_ARGS
theme download config/settings_data.json config/settings_schema.json
timestamp=$(date +%d-%m-%Y-%H:%M:%S)
mv config/settings_data.json ${timestamp}_settings_data.json
mv config/settings_schema.json ${timestamp}_settings_schema.json

ls -la ./ ./config

aws s3 cp ./${timestamp}_settings_data.json s3://${AWS_BUCKET_NAME}
aws s3 cp ./${timestamp}_settings_schema.json s3://${AWS_BUCKET_NAME}
