#!/bin/bash
# Switch to Python 3.13 as default

echo "=== Switching to Python 3.13 ==="
echo ""

# Check if Python 3.13 exists
if [ ! -f "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3" ]; then
    echo "❌ Python 3.13 not found!"
    echo "Please install Python 3.13 first."
    exit 1
fi

echo "Current Python version:"
python3 --version
echo ""

# Create symlink approach (requires sudo)
echo "Option 1: Create alias in ~/.zshrc (Recommended - no sudo needed)"
echo ""
echo "Add these lines to ~/.zshrc:"
echo ""
echo "# Use Python 3.13 as default"
echo "alias python3='/Library/Frameworks/Python.framework/Versions/3.13/bin/python3'"
echo "alias python='/Library/Frameworks/Python.framework/Versions/3.13/bin/python3'"
echo "export PATH=\"/Library/Frameworks/Python.framework/Versions/3.13/bin:\$PATH\""
echo ""

# Check if already in .zshrc
if [ -f ~/.zshrc ]; then
    if grep -q "Python.framework/Versions/3.13" ~/.zshrc; then
        echo "✓ Python 3.13 path already in ~/.zshrc"
    else
        echo "Would you like to add Python 3.13 to your PATH? (y/n)"
        echo "Run this command to add it:"
        echo ""
        echo "cat >> ~/.zshrc << 'EOF'"
        echo "# Use Python 3.13 as default"
        echo "export PATH=\"/Library/Frameworks/Python.framework/Versions/3.13/bin:\$PATH\""
        echo "EOF"
        echo ""
        echo "Then run: source ~/.zshrc"
    fi
else
    echo "~/.zshrc does not exist. Creating it..."
    echo "# Use Python 3.13 as default" > ~/.zshrc
    echo "export PATH=\"/Library/Frameworks/Python.framework/Versions/3.13/bin:\$PATH\"" >> ~/.zshrc
    echo "✓ Created ~/.zshrc with Python 3.13 path"
    echo "Run: source ~/.zshrc"
fi

echo ""
echo "After updating, verify with:"
echo "  python3 --version"
echo "  which python3"

