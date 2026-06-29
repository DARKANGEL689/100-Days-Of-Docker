import json
import subprocess
from openai import OpenAI

llm = OpenAI(api_key="EMPTY", base_url="http://vllm-api-svc.default.svc.cluster.local:8000/v1")

def apply_security_patch(vulnerability_data):
    print("[AGENT] Analyzing vulnerability payload...")
    
    prompt = f"The following code contains a vulnerability: {vulnerability_data}. Provide only the corrected code block."
    
    response = llm.chat.completions.create(
        model="Qwen/Qwen2.5-1.5B-Instruct",
        messages=[{"role": "user", "content": prompt}]
    )
    
    fixed_code = response.choices[0].message.content
    print(f"[AGENT] Fix generated: {fixed_code}")
    
    with open("app.py", "w") as f:
        f.write(fixed_code)
    
    print("[AGENT] Patch applied to source repository.")

