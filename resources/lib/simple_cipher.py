"""
Simple Cipher - Decryption function
Decrypts an encrypted string by shifting each character k steps counterclockwise on an alphabet wheel.
"""
import urllib3

# Suppress InsecureRequestWarning for unverified HTTPS requests
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def simple_cipher(encrypted, k):
    """
    Decrypts an encrypted string using a simple cipher.
    
    Args:
        encrypted (str): The encrypted string (uppercase letters only)
        k (int): Number of steps to shift counterclockwise
    
    Returns:
        str: The decrypted string
    
    Example:
        simple_cipher('VTAOG', 2) returns 'TRYME'
    """
    if not encrypted:
        return ""
    
    # Create alphabet list for easy indexing
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    decrypted = []
    
    for char in encrypted:
        if char not in alphabet:
            # If character is not a letter, keep it as is
            decrypted.append(char)
            continue
        
        # Find current position in alphabet
        current_pos = alphabet.index(char)
        
        # Move k steps counterclockwise (subtract k)
        # Use modulo to handle wrapping around the wheel
        new_pos = (current_pos - k) % 26
        
        # Get the decrypted character
        decrypted_char = alphabet[new_pos]
        decrypted.append(decrypted_char)
    
    return ''.join(decrypted)

