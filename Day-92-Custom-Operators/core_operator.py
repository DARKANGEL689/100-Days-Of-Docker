import kopf
import kubernetes.client as k8s
from kubernetes import config

@kopf.on.create('protocol.com', 'v1', 'antigravityengines')
def create_fn(spec, name, namespace, logger, **kwargs):
    try:
        config.load_kube_config()
    except:
        config.load_incluster_config()

    thrust = spec.get('thrustLevel', 'low')
    plasma_core = spec.get('plasmaCore', False)
    
    replicas = 3 if thrust == 'maximum' else 1
    logger.info(f"Synthesizing Antigravity Engine '{name}'. Thrust detected: {thrust.upper()}")

    api = k8s.AppsV1Api()
    deployment = {
        "apiVersion": "apps/v1",
        "kind": "Deployment",
        "metadata": {"name": f"{name}-thruster"},
        "spec": {
            "replicas": replicas,
            "selector": {"matchLabels": {"app": name}},
            "template": {
                "metadata": {"labels": {"app": name}},
                "spec": {
                    "containers": [{
                        "name": "engine",
                        "image": "hashicorp/http-echo:1.0.0",
                        "args": [f"-text=ANTIGRAVITY ENGINE '{name}' ONLINE. Thrust: {thrust.upper()} | Plasma Core: {plasma_core}"]
                    }]
                }
            }
        }
    }

    kopf.adopt(deployment)

    try:
        api.create_namespaced_deployment(namespace=namespace, body=deployment)
        logger.info(f"Successfully synthesized {name}-thruster with {replicas} physical replicas.")
    except Exception as e:
        logger.error(f"Failed to synthesize engine: {e}")