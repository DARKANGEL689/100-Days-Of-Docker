## Day 154: Edge Traffic Shaping & Layer 7 Rate Limiting

**Objective:** Protect highly elastic, auto-scaling backend infrastructure from Denial of Service (DoS) conditions and API abuse. By engineering a standalone Layer 7 API Gateway with allocated shared memory zones, we enforced strict Request-Per-Second (RPS) thresholds based on client IP origination, preventing runaway compute scaling.

### Architecture & Engineering Logs
1. **Target Backend Provisioning:** Deployed an unshielded standard FastAPI inference deployment to serve as the protected resource.
2. **Memory Zone Allocation:** Engineered an NGINX ConfigMap utilizing the `limit_req_zone` directive, allocating 10MB of stateful memory to track incoming client `$binary_remote_addr` metrics.
3. **Traffic Shaping Rules:** Enforced a rigid throughput ceiling of 2 requests per second (2r/s) with a strictly controlled burst queue (`burst=1 nodelay`), returning HTTP 429 status codes for exceeding traffic.
4. **Denial of Service Audit:** Authored an automated barrage script to fire parallel requests at the ingress gateway, mathematically validating the immediate execution of `429 Too Many Requests` rejections at the network edge.