#!/bin/bash

echo "Creating mixed file type symbolic links..."

# Create directory structure
mkdir -p src/python src/javascript src/web
mkdir -p configs assets bin lib
mkdir -p docs data logs archives

# Create source files
echo 'print("Hello from Python!")' > src/python/app.py
echo 'console.log("Hello from JavaScript!");' > src/javascript/main.js
echo '<html><body><h1>Hello World</h1></body></html>' > src/web/template.html

# Create configuration files
echo 'app:
  name: "My App"
  version: "1.0.0"' > configs/production.yaml
echo '{"debug": true, "port": 3000}' > configs/app.json
echo 'DEBUG=true
PORT=3000' > configs/.env.production

# Create binary and data files
echo "binary data" > bin/app
chmod +x bin/app
echo "library data" > lib/libssl.so.1.1
echo "binary content" > assets/data.bin

# Create documentation files
echo "# Application Documentation" > docs/README.md
echo "# API Documentation" > docs/api.md
echo "# Changelog

## v1.0.0
- Initial release" > docs/changelog.md

# Create data and log files
echo "2024-01-15 backup" > archives/backup-2024-01-15.zip
echo "name,age,city
John,30,NYC
Jane,25,LA" > data/export.csv
echo "2024-01-15 10:30:00 INFO Application started" > logs/app.log

# Create symlinks to different file types
ln -sf src/python/app.py main.py
ln -sf src/javascript/main.js app.js
ln -sf src/web/template.html index.html
ln -sf configs/production.yaml config.yaml
ln -sf configs/app.json settings.json
ln -sf configs/.env.production env
ln -sf bin/app executable
ln -sf lib/libssl.so.1.1 library.so
ln -sf assets/data.bin data.bin
ln -sf docs/README.md README
ln -sf docs/api.md API.md
ln -sf docs/changelog.md CHANGELOG
ln -sf archives/backup-2024-01-15.zip backup.zip
ln -sf data/export.csv data.csv
ln -sf logs/app.log log.txt

echo "Mixed file type symlinks created successfully!"
echo "Current symlinks:"
ls -la main.py app.js index.html config.yaml settings.json env
ls -la executable library.so data.bin README API.md CHANGELOG
ls -la backup.zip data.csv log.txt
