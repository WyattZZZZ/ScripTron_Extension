import os
import json

def generate_registry_for_type(type_dir, manifest_name, output_file):
    if not os.path.exists(type_dir):
        print(f"Directory {type_dir} does not exist. Skipping.")
        return

    registry = []
    
    # Iterate over immediate subdirectories
    for item in os.listdir(type_dir):
        item_path = os.path.join(type_dir, item)
        if os.path.isdir(item_path):
            manifest_path = os.path.join(item_path, manifest_name)
            if os.path.exists(manifest_path):
                try:
                    with open(manifest_path, 'r', encoding='utf-8') as f:
                        manifest_data = json.load(f)
                    
                    # Inject repository path
                    # e.g. "clis/example-cli"
                    repository_path = f"{type_dir}/{item}"
                    manifest_data['repository_path'] = repository_path
                    
                    registry.append(manifest_data)
                except Exception as e:
                    print(f"Error reading {manifest_path}: {e}")
            else:
                print(f"Warning: {manifest_name} not found in {item_path}")
                
    # Write aggregated registry
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(registry, f, indent=2, ensure_ascii=False)
        print(f"Successfully generated {output_file} with {len(registry)} items.")
    except Exception as e:
        print(f"Error writing {output_file}: {e}")

def main():
    print("Generating registries...")
    generate_registry_for_type("clis", "cli.json", "clis.json")
    generate_registry_for_type("models", "model.json", "models.json")
    generate_registry_for_type("skills", "skill.json", "skills.json")
    print("Done.")

if __name__ == "__main__":
    main()
