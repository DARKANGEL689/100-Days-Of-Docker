import os
import re
from openai import OpenAI

llm = OpenAI(api_key="EMPTY", base_url="http://vllm-api-svc.default.svc.cluster.local:8000/v1")

def generate_microservice():
    print("[FACTORY] Waking up. Reading Architect's Intent...")
    with open("/workspace/intent/specification.txt", "r") as f:
        intent = f.read()

    system_prompt = (
        "You are an Elite Enterprise Software Engineer. You write production-grade code. "
        "Strictly output the requested files wrapped in <file name=\"filename.ext\">content</file> tags. "
        "Do not output any conversational text."
    )

    print("[FACTORY] Transmitting Intent to Intelligence Core. Synthesizing codebase...")
    response = llm.chat.completions.create(
        model="Qwen/Qwen2.5-1.5B-Instruct",
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": intent}
        ],
        temperature=0.2 
    )

    generated_text = response.choices[0].message.content

    print("[FACTORY] Codebase synthesized. Formatting physical files...")
    file_pattern = r'<file name="([^"]+)">\s*(.*?)\s*</file>'
    files = re.findall(file_pattern, generated_text, re.DOTALL)

    output_dir = "/workspace/output"
    os.makedirs(output_dir, exist_ok=True)

    for filename, content in files:
        filepath = os.path.join(output_dir, filename)
        with open(filepath, "w") as f:
            f.write(content)
        print(f"[FACTORY] Successfully generated: {filename}")

if __name__ == "__main__":
    generate_microservice()