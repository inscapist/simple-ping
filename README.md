# Simple Ping

All this project does is to serve an API that returns 200 status to the caller.

This is useful to be used when paired with NodePort service, so that load balancer can determine healthy nodes to route to.

## FAQs

#### Why not just let load balancer calls /healthz of the web app?

Well, imagine that you are running private cluster (mongodb, redis) that should have serve web requests. But you are using Health Checks for Auto Scaling instances.

#### Is this project overkills?

Certainly, I am learning Nix.

## Requirements

- cabal2nix
- nix
