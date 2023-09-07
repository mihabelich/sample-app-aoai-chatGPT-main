#!/bin/sh

# Restoring backend python packages
echo ""
echo "Restoring backend python packages"
echo ""
python -m pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Failed to restore backend python packages"
    exit 1
fi

# Restoring frontend npm packages
echo ""
echo "Restoring frontend npm packages"
echo ""
cd frontend
npm install
if [ $? -ne 0 ]; then
    echo "Failed to restore frontend npm packages"
    exit 1
fi

# Building frontend
echo ""
echo "Building frontend"
echo ""
npm run build
if [ $? -ne 0 ]; then
    echo "Failed to build frontend"
    exit 1
fi

# Starting backend
echo ""
echo "Starting backend"
echo ""
cd ..
xdg-open http://127.0.0.1:5000
python ./app.py
if [ $? -ne 0 ]; then
    echo "Failed to start backend"
    exit 1
fi
