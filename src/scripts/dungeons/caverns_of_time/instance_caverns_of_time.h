#ifndef DEF_COT_H
#define DEF_COT_H

enum
{
    INSTANCE_BM_MAX_ENCOUNTER = 3,

    TYPE_GERASTRASZ = 4,
    TYPE_CHRONORMU = 5
};

struct cotDataStruct
{
    time_t m_itemTimer;
};

static cotDataStruct cotData = {0};
#endif
