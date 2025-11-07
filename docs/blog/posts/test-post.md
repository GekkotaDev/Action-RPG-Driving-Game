---
date: 2025-10-08
authors: [gekkotadev]
categories:
  - General
---

# Test Post (This Week's Progress)

For the progress that has been made so far this week it has been mainly setting up the architecture of the project, the infrastructure surrounding the project, and a few features that could be easily implemented.

The infrastructure surrounding the project so far is a work in progress where this documentation site + developer logs have at least been implemented, but what has yet to be implemented would be (as of time of writing) actually publishing this site to be viewable without cloning the repository and automated workflow actions to reduce the amount of manual work needed to be done — that is, to automate the process of unit testing, publishing updates to this site, and the creation of binaries/executables.

The architecture this project follows has been taking up shape with [separation between assets and code](https://youtu.be/s1ZQnS_tOg0)* with the latter following the [vertical slice architecture](https://www.milanjovanovic.tech/blog/vertical-slice-architecture) to keep the codebase easier to maintain by colocating the subsystems' files not by the work that they perform but rather the feature that they encompass.

Feature wise we wanted to get over with the foundations for giving the player a frantic sense of speed achieved through a middleware system — an implementation of the [chain of command pattern](https://refactoring.guru/design-patterns/chain-of-responsibility) — where each chain focuses on a single responsibility given the context of the vehicle, camera and the delta time. Using this middleware system, we've implemented following tricks

- Blurring the player's depth of field vision based on their current speed to simulate the effect of tunnel vision. A phenomenon primarily associated with [fighter aircraft](https://jmvh.org/article/https-doi-ds-org-doilink-03-2023-12453347-jmvh-vol-6-no-3/) but can happen in [certain automobiles](https://www.topgear.com/car-reviews/id-r/first-drive)
- Stretching the player's field of vision based on their current speed. This effect is most noticeable in games such as [Need For Speed ProStreet](https://youtu.be/6mrQo1vIUDQ) where it is used to great effect to make the cars feel faster than they actually are.
- Tire smoke, tire squealing and camera shake whenever the car loses traction (e.g: general wheel spin, lack of launch control). While not necessarily directly related to providing a sense of high speed can nevertheless imply that a car has enough engine power to overpower its own tires.

Despite having these features implemented I'm not quite content with what to show so far

- Lack of [vignette](https://www.adobe.com/uk/creativecloud/photography/discover/what-is-vignette-in-photography.html). While blurring the depth of field can help imply tunnel vision, it does feel like it's missing something to fully sell the effect which is where gradually introducing a vignette effect can help.
- Lack of damage particle effects. This is not merely for appearance purposes but rather to sell the impression to the player where there's consequences to driving dirty even if it's merely loss of time from losing momentum.
- Lack of vehicles. Fortunately it's quite easy to implement the actual behaviors of the vehicles given it's just node composition whilst modelling shouldn't be too difficult given low polygon count and the invaluable resources on how to use Blender (most important are mesh extrusions. protusions, and the likes, boolean operations and other modifiers, and some slight raw vertex manipulation).
- Camera vibrations relative not to the player's speed but to their velocity taking into account that not only can camera vibrations be used to simulate mechanical vibrations at high speed but also effects such as crashes.

As of this time of writing, I plan on setting up [automated workflows](https://github.com/features/actions) (CI/CD) and kanban based progress tracking ([Github Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)), *perhaps* setting up templates for [Github Issues](https://github.com/features/issues) to formalize bug reporting — in other words structured and unvague reports — and to set up [Github Discussions](https://docs.github.com/en/discussions) to address a rather self-destructive flaw of Facebook Messenger where information is easily lost with the total lack of organized discussions. It is ideal information does not get lost (assuming everyone is on-board with this workflow otherwise we'll just have to continue with a data lossy workflow).

## UPDATE (2025-11-07)

- Instead of using Blender I've opted to using a combination of Blockbench and Material Maker (for textures; think albedos, normal maps, bump maps, etc.)
- I still haven't set up the kanban board quite properly yet.
