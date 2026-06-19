# Social Gathering Scheduling Problem

The objective is to organize a social event at a maritime venue.

The total of $\gamma$ vessels are designated as reception venues, while the crews of $\beta$ other vessels visit these
reception vessels for multiple consecutive half-hour intervals. The crew of a reception vessel remains onboard as hosts,
whereas the crew of a visiting vessel collectively visits several reception vessels. Each vessel has a limited capacity,
denoted as $\delta$, and crew sizes, represented as $\sigma$, vary. The total number of individuals on a vessel,
including both host and visiting crews, must not exceed its capacity. A visiting vessel cannot revisit a reception
vessel, and visiting crews cannot interact with each other more than once. The challenge for the event organizer is to
minimize the number of reception vessels, denoted as $\gamma$.

The event involves multiple time periods, represented as $\tau$, during which these interactions take place. The visits
are scheduled such that all guest vessels' crews, along with the host crew, do not exceed the capacity of the host
vessel at any given time period. Furthermore, to ensure a diverse and engaging experience, no two crews, whether hosts
or guests, can attend the same social gathering more than once. In the schedule the visiting vessels should be sorted to 
remove symmetry.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn with added symmetry breaking information)
