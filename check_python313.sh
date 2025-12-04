#!/bin/bash
# Check if Python 3.13 is installed

echo "Checking for Python 3.13..."
echo ""

# Check in Python framework
if [ -f "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3" ]; then
    echo "✓ Python 3.13 found in Framework:"
    /Library/Frameworks/Python.framework/Versions/3.13/bin/python3 --version
    echo ""
fi

# Check via python3.13 command
if command -v python3.13 &> /dev/null; then
    echo "✓ Python 3.13 available as 'python3.13':"
    python3.13 --version
    echo ""
fi

# Check via pyenv
if command -v pyenv &> /dev/null; then
    echo "✓ pyenv found. Installed versions:"
    pyenv versions
    echo ""
fi

# Check via Homebrew
if command -v brew &> /dev/null; then
    if brew list python@3.13 &> /dev/null 2>&1; then
        echo "✓ Python 3.13 installed via Homebrew:"
        brew list python@3.13
        echo ""
    fi
fi

echo "Current default Python:"
python3 --version
which python3

