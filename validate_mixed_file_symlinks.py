#!/usr/bin/env python3

import os
import mimetypes

def validate_mixed_file_symlinks():
    """Validate symlinks pointing to different file types."""
    
    mixed_file_symlinks = [
        ('main.py', 'src/python/app.py'),
        ('app.js', 'src/javascript/main.js'),
        ('index.html', 'src/web/template.html'),
        ('config.yaml', 'configs/production.yaml'),
        ('settings.json', 'configs/app.json'),
        ('env', 'configs/.env.production'),
        ('executable', 'bin/app'),
        ('library.so', 'lib/libssl.so.1.1'),
        ('data.bin', 'assets/data.bin'),
        ('README', 'docs/README.md'),
        ('API.md', 'docs/api.md'),
        ('CHANGELOG', 'docs/changelog.md'),
        ('backup.zip', 'archives/backup-2024-01-15.zip'),
        ('data.csv', 'data/export.csv'),
        ('log.txt', 'logs/app.log')
    ]
    
    print("Validating mixed file type symlinks...")
    
    for link_path, expected_target in mixed_file_symlinks:
        if os.path.exists(link_path):
            if os.path.islink(link_path):
                actual_target = os.readlink(link_path)
                if actual_target == expected_target:
                    # Get file type
                    if os.path.exists(expected_target):
                        mime_type, _ = mimetypes.guess_type(expected_target)
                        file_type = mime_type or "unknown"
                        print(f"✅ {link_path} -> {actual_target} ({file_type})")
                    else:
                        print(f"✅ {link_path} -> {actual_target} (target not found)")
                else:
                    print(f"❌ {link_path} -> {actual_target} (expected: {expected_target})")
            else:
                print(f"❌ {link_path} exists but is not a symlink")
        else:
            print(f"❌ {link_path} does not exist")
    
    print("\nMixed file type symlink validation completed!")

if __name__ == "__main__":
    validate_mixed_file_symlinks()
