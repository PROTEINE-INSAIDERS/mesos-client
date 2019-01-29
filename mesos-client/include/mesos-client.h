#ifndef MESOS_CLIENT
#define MESOS_CLIENT

#define UNION_CASE(T, C, L) \
instance UnionCase T where \
    type Case T = C; \
    lCase = const L

#define UNIT_CASE(T) UNION_CASE(T, (), lUnitCase)

#endif