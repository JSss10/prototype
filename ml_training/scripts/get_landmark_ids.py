#!/usr/bin/env python3
"""
Quick script to fetch landmark IDs from Supabase for the trained model.
"""
import os
import sys
from pathlib import Path
import requests
from dotenv import load_dotenv

# Load environment variables
env_path = Path('.env')
if env_path.exists():
    load_dotenv(env_path)
else:
    env_path = Path('ml_training/.env')
    if env_path.exists():
        load_dotenv(env_path)

# Get Supabase credentials
SUPABASE_URL = os.getenv('SUPABASE_URL')
SUPABASE_ANON_KEY = os.getenv('SUPABASE_ANON_KEY')

if not SUPABASE_URL or not SUPABASE_ANON_KEY:
    print("Error: Supabase credentials not found in .env file")
    print("\nPlease create ml_training/.env with:")
    print("SUPABASE_URL=your_supabase_url")
    print("SUPABASE_ANON_KEY=your_anon_key")
    sys.exit(1)

# Landmark names we're looking for
LANDMARK_NAMES = {
    'grossmunster': ['Grossmünster', 'Grossmuenster'],
    'fraumunster': ['Fraumünster', 'Fraumuenster'],
    'opera_house': ['Opera House', 'Opernhaus', 'Zurich Opera House']
}

def fetch_landmarks():
    """Fetch all landmarks from Supabase."""
    url = f"{SUPABASE_URL}/rest/v1/landmarks"
    headers = {
        'apikey': SUPABASE_ANON_KEY,
        'Authorization': f'Bearer {SUPABASE_ANON_KEY}'
    }

    params = {
        'select': 'id,name,name_en',
        'is_active': 'eq.true'
    }

    try:
        response = requests.get(url, headers=headers, params=params, timeout=10)
        response.raise_for_status()
        return response.json()
    except Exception as e:
        print(f"Error fetching landmarks: {e}")
        sys.exit(1)

def find_landmark_ids(landmarks):
    """Find the IDs for our trained landmarks."""
    mapping = {}

    for landmark in landmarks:
        name = landmark.get('name', '')
        name_en = landmark.get('name_en', '')
        landmark_id = landmark.get('id', '')

        # Check if this landmark matches any of our trained classes
        for class_name, possible_names in LANDMARK_NAMES.items():
            for possible_name in possible_names:
                if possible_name.lower() in name.lower() or possible_name.lower() in name_en.lower():
                    if class_name not in mapping:  # Only add first match
                        mapping[class_name] = {
                            'id': landmark_id,
                            'name': name,
                            'name_en': name_en
                        }
                        break

    return mapping

def main():
    print("Fetching landmarks from Supabase...")
    landmarks = fetch_landmarks()
    print(f"✓ Found {len(landmarks)} landmarks in database")

    print("\nSearching for trained landmarks...")
    mapping = find_landmark_ids(landmarks)

    if len(mapping) < 3:
        print(f"\n⚠️  Warning: Only found {len(mapping)}/3 landmarks")
        print("Found:", list(mapping.keys()))
        print("\nYou may need to manually search for the missing landmarks.")

    print("\n" + "="*60)
    print("Swift Code for VisionService.swift")
    print("="*60)
    print("\nAdd this to your VisionService.swift:")
    print("\nprivate let classToLandmarkID: [String: String] = [")

    for class_name in ['fraumunster', 'grossmunster', 'opera_house']:
        if class_name in mapping:
            info = mapping[class_name]
            print(f'    "{class_name}": "{info["id"]}",  // {info.get("name_en") or info["name"]}')
        else:
            print(f'    "{class_name}": "REPLACE_WITH_ID",  // NOT FOUND - Check Supabase')

    print("]")

    print("\n" + "="*60)
    print("Landmark Details")
    print("="*60)

    for class_name, info in mapping.items():
        print(f"\n{class_name}:")
        print(f"  ID: {info['id']}")
        print(f"  Name: {info['name']}")
        if info.get('name_en'):
            print(f"  English: {info['name_en']}")

if __name__ == '__main__':
    main()