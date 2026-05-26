#!/bin/bash
echo "Establishing tunnel to RabbitMQ REST API..."
kubectl port-forward svc/rabbitmq-svc 15672:15672 &
TUNNEL_PID=$!
sleep 3

echo "Flooding the task_queue with 30 messages..."
echo "-------------------------------------------"
for i in {1..30}; do
  curl -s -u guest:guest -H "content-type:application/json" \
    -XPOST http://localhost:15672/api/exchanges/%2f/amq.default/publish \
    -d '{"properties":{},"routing_key":"task_queue","payload":"PROCESS_IMAGE_'$i'","payload_encoding":"string"}' > /dev/null
  echo "Message $i injected into queue."
done
echo "-------------------------------------------"

kill $TUNNEL_PID