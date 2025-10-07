# `vehicle_subsystem`

In contrast to [`gevp_extensions`](../gevp_extensions/), this subsystem is
focused primarily on being a [facade](https://refactoring.guru/design-patterns/facade)
hiding the messier and rapidly changing internal details of the vehicles, and
hopefully reducing the overall amount of refactors by giving dependents a
relatively more stable interface.
