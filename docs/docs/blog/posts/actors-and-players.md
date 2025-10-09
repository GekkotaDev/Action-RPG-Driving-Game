---
draft: true

date: 0001-01-01
authors: [gekkotadev]
categories:
  - General
---

[vertical slice architecture]: https://www.milanjovanovic.tech/blog/vertical-slice-architecture

# Actors and Players

What's in a player? It's a simple question: the person playing the game except what are the technical requirements? Perhaps just a mere controller for a rigid body except what about the state associated with the player? What about the player's dependencies since it certainly isn't just a mere controller isn't it? How does it communicate with these dependencies and to dependents? These are guiding questions, sure, but it is a start in order to break down this large technical feature down to more manageable details.

## Vertical Slices

It sounds daunting that the player alone not being a mere character controller encompasses a wide range of functionality thus manages a wide scope of features, but fortunately it doesn't have to directly manage all of those by itself. A technique more easily afforded to us by the [vertical slice architecture] is delegation to subsystems, and in turn, follows the single responsibility principle which enhances long term maintainability.

## Internode Communication

## Packing Up
