# Models of My Thai Star

This is some documentaion that is true for all non-generated models. Instead of having the same text in ever class doc-comment, I put it here.

#### Why Equatable?
All models extends [Equatable] to overwrite their comparison behavior. A model will be compared based on it's [props] instead of it's reference. This way we can easily compare if 2 models are the same, based on their values and not based on their location in memory.

#### Why Immutable?
All model classes are [immutable] for 2 reasons: 

##### Bloc Package
All models are or are part of event and/or state classes. Event and state classes are required to be [immutable] by the bloc package for the following reasons _(1)_:
 - It allows the library to detect state changes efficiently
 - It makes handling data safer (no side-effects or mutations)
 - It makes state management predictable because we're using static snapshots of our state instead of state which can change at any point in time leading to strange/unpredictable behavior.

##### Immutability is good in general
In general, we should always strive to designing software so that as many structures as feasible are immutable _(2)_.

_(1) Felix Angelov, 2019 https://github.com/felangel/bloc/issues/292_
_(2) J. Bloch, Effective Java, Second Edition. Upper Saddle River, NJ: Addison-Wesley, 2008_