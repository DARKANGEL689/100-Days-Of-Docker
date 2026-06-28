import json
import numpy as np
from redis import Redis
from sentence_transformers import SentenceTransformer
from openai import OpenAI

redis_client = Redis(host='semantic-cache-svc', port=6379, decode_responses=True)
model = SentenceTransformer("all-MiniLM-L6-v2")

def get_semantic_cache(query):
    query_vec = model.encode(query).astype(np.float32).tobytes()
    results = redis_client.ft("idx").search(f"*=>[KNN 1 @vector $vec AS dist]", 
                                            query_params={"vec": query_vec})
    if results.total > 0 and float(results.docs[0].dist) > 0.9: 
        return results.docs[0].json['answer']
    return None

def set_semantic_cache(query, answer):
    query_vec = model.encode(query).astype(np.float32).tobytes()
    redis_client.json().set(f"cache:{query}", "$", {"answer": answer, "vector": query_vec})
    # Update search index here...
    print("[CACHE] New intelligence saved to fast-access memory.")

