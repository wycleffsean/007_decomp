#include <PR/os.h>
#include <PR/os_internal.h>
#include <PR/R4300.h>

#if defined(NO_TLB)
u32 __osGetTLBHi(s32 index)
{
    (void)index;
    return 0;
}

u32 __osProbeTLB(void *addr)
{
    (void)addr;
    return 0;
}

void osUnmapTLB(s32 index)
{
    (void)index;
}

void osMapTLBRdb(void)
{
}
#endif
