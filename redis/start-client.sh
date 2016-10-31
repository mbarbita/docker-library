#!/bin/bash
docker run -it --rm  --link redis_redis_1:redis --network redis_default redis redis-cli -h redis -p 6379
