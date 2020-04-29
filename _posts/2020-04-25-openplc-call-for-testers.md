---
layout: post
title:  OpenPLC v3 Call for Testers
date:   2020-04-25 14:00:00 - 5:00
categories: general
author: Garret Fick
gravatar_hash: dd8003b403e5aff6a8ce41f3c150b810
---

2019 saw enormous changes to OpenPLC, but mostly behind the
hood in a working branch. As our first blog post, I'd like to take the opportunity
to introduce both some of the changes and the plans and promote a call for
testers. I'll also take the opportunity to introduce myself,
[garretfick](https://github.com/garretfick) as
the primary author of these changes under the guidance of
[thiagoralves](https://github.com/thiagoralves), and supported by
[Smarter Grid Solutions](https://github.com/smartergridsolutions).

## What's Changed

First, what's changed and why? My primary objective has been improvements that
enable releasing OpenPLC often with confidence that the changes work. A second
objective has been to make it possible to run OpenPLC without relying on the
web interface.

In both of these areas, we've made huge progress and the changes over the last
year have included:

- restructuring to separate user-defined code from the application-defined code
- clarifying (and changing) the licensing to enable commercial use
- developing robust automated build capabilities for the runtime
- enhancing the capabilities of glue variables (also known as located variables)
- enhancing the implementation of the DNP3 outstation
- creating a suite of automated unit and integration tests
- enabling use of the runtime without the webserver

That's a lot of changes. The git statistics report:

{% highlight shell %}
git diff --shortstat e6206ddd3db00e5851866128c1a6dc4c3bdfe1b0 9c925c590d97459508ac16e8574f0daeef2c1a83
 278 files changed, 72695 insertions(+), 4829 deletions(-)
{% endhighlight %}

The numbers are inflated because we did move items around, but even if we
calculate the statistics from a commit after the restructuring, we still still
see enormous changes.

{% highlight shell %}
git diff --shortstat e6206ddd3db00e5851866128c1a6dc4c3bdfe1b0 1c173cf15a57f8f7a6a0b4d7a6965cbc62b6dade
 163 files changed, 62915 insertions(+), 2076 deletions(-)
{% endhighlight %}

No matter how you calculate it, that's a lot of changes. I don't think we have
yet reached the larger goals of being able to release often or run standalone,
but we have made enormous progress towards those goals.

## Call for Testers

With changes as big as these, it is inevitable that you have created risk.
To date, all of the changes are in the `development` branch, and they are not
yet ready for the general consumption.

We think that the changes are good and there are zero known issues. To prove
that the changes are good, we now need wider testing, and that's where you
come in. If you have an existing project that uses OpenPLC, we would appreciate
your trying to build and run your project using the `development` branch.

If it works - please let us know. If there are issues, please also let us know
by [creating an issue on GitHub](https://github.com/thiagoralves/OpenPLC_v3/issues).

There is one key area that we'd like to highlight for feedback (general
issues are also of interest).

We have been selective in this work to limit where we changed APIs. Most
(or perhaps all) projects will not notice a difference. You upload your code and
optionally select/implement the hardware layer just as you have done in prior
versions. However, some projects may require small changes (such as including
a new header) and we'd like to prepare a practical "upgrade guide".  If there
are things you needed to change, please also let us know by
[creating an issue on GitHub](https://github.com/thiagoralves/OpenPLC_v3/issues).

## Future Release

We plan some kind of formal release once we complete testing and can write the
necessary documentation. At this point, we don't have a defined set of tasks
nor a timeline. I'm personally aiming to release before the end of July
2020, but it will only happen when things are ready.
