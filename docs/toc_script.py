import os
import re
import json
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
END_TAG = "## Guidelines for the development of MPMMine"

def get_contents(path=""):
    safe_path = urllib.parse.quote(path)
    url = f"{API_URL}/{safe_path}?ref={BRANCH_NAME}"
    
    req = urllib.request.Request(url)
    if TOKEN:
        req.add_header("Authorization", f"token {TOKEN}")
    try:
        with urllib.request.urlopen(req) as response:
            return json.loads(response.read().decode())
    except Exception as e:
        print(f"Error fetching {path} on branch {BRANCH_NAME}: {e}")
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