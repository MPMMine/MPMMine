import os
import re
import json
import time
import random
import urllib.request
import urllib.parse

# Environment and Paths
REPO = os.getenv("GITHUB_REPOSITORY")
TOKEN = os.getenv("GITHUB_TOKEN")
BRANCH_NAME = os.getenv("BRANCH_NAME", "main")
API_URL = f"https://api.github.com/repos/{REPO}/contents"

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
README_PATH = os.path.join(BASE_DIR, "README.md")

START_TAG = "## Problem and MP model list"
END_TAG = "## Usage"

def get_contents(path="", max_retries=5):
    safe_path = urllib.parse.quote(path)
    url = f"{API_URL}/{safe_path}?ref={BRANCH_NAME}"
    
    req = urllib.request.Request(url)
    if TOKEN:
        req.add_header("Authorization", f"token {TOKEN}")

    for attempt in range(max_retries):
        try:
            with urllib.request.urlopen(req) as response:
                return json.loads(response.read().decode())

        except urllib.error.HTTPError as e:
            if e.code in [404, 429, 500, 502, 503, 504]:
                if attempt == max_retries - 1:
                    print(f"Failed to fetch {path} after {max_retries} attempts. Final Error: HTTP {e.code}")
                    return []
                sleep_time = (2 ** attempt) + random.uniform(0, 1)
                print(f"HTTP {e.code} for {path}. Retrying in {sleep_time:.2f} seconds... (Attempt {attempt + 1}/{max_retries})")
                time.sleep(sleep_time)
            else:
                print(f"Permanent HTTP Error {e.code} fetching {path}: {e.reason}")
                return []

        except urllib.error.URLError as e:
            if attempt == max_retries - 1:
                print(f"Network error for {path} after {max_retries} attempts: {e.reason}")
                return []
            sleep_time = (2 ** attempt) + random.uniform(0, 1)
            print(f"Network error. Retrying in {sleep_time:.2f} seconds...")
            time.sleep(sleep_time)

    return []

def update_repo_stats():
    print("Fetching problems from API...")
    problems = get_contents("problems")
    problem_folders = sorted([p['name'] for p in problems if p.get('type') == 'dir'])
    
    total_problems = len(problem_folders)
    total_mzn_models = 0
    total_instances = 0
    total_descriptions = 0
    toc_lines = []

    for name in problem_folders:
        models = get_contents(f"problems/{name}/models")
        mzn_dirs = [m['name'] for m in models if m.get('type') == 'dir']
        total_mzn_models += len(mzn_dirs)
        
        prob_instances = 0
        prob_descriptions = 0
        
        for mzn in mzn_dirs:
            instances = get_contents(f"problems/{name}/models/{mzn}/instances")
            inst_dirs = [i['name'] for i in instances if i.get('type') == 'dir']
            total_instances += len(inst_dirs)
            prob_instances += len(inst_dirs)
            
            descriptions = get_contents(f"problems/{name}/models/{mzn}/descriptions")
            desc_files = [d['name'] for d in descriptions if d.get('type') == 'file' and d['name'].endswith('.md')]
            total_descriptions += len(desc_files)
            prob_descriptions += len(desc_files)

        url_path = name.replace(" ", "%20")
        toc_lines.append(f"* [{name}](problems/{url_path}) — `{prob_instances} instances`, `{prob_descriptions} descriptions`")

    if not os.path.exists(README_PATH):
        print(f"README not found at {README_PATH}")
        return

    with open(README_PATH, "r", encoding="utf-8") as f:
        full_text = f.read()

    if START_TAG not in full_text or END_TAG not in full_text:
        print("Required tags not found in README!")
        return

    header_part = full_text.split(START_TAG)[0]
    footer_part = full_text.split(END_TAG)[1]

    header_part = re.sub(r"(Problems-)[^/-]+(-blue)", rf"\g<1>{total_problems}\g<2>", header_part)
    header_part = re.sub(r"(MZN%20Models-)[^/-]+(-orange)", rf"\g<1>{total_mzn_models}\g<2>", header_part)
    header_part = re.sub(r"(Instances-)[^/-]+(-purple)", rf"\g<1>{total_instances}\g<2>", header_part)
    header_part = re.sub(r"(Descriptions-)[^/-]+(-brightgreen)", rf"\g<1>{total_descriptions}\g<2>", header_part)

    new_toc = "\n".join(toc_lines)
    final_output = f"{header_part}{START_TAG}\n\n{new_toc}\n\n{END_TAG}{footer_part}"

    with open(README_PATH, "w", encoding="utf-8") as f:
        f.write(final_output)
    
    print(f"Final Stats: {total_problems} Problems, {total_mzn_models} Models, {total_instances} Instances, {total_descriptions} Markdown Descriptions.")

if __name__ == "__main__":
    update_repo_stats()
