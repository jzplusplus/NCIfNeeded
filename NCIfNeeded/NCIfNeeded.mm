#line 1 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"




#include <logos/logos.h>
#include <substrate.h>
@class SBModeViewController; 
static void (*_logos_orig$_ungrouped$SBModeViewController$hostWillPresent)(SBModeViewController*, SEL); static void _logos_method$_ungrouped$SBModeViewController$hostWillPresent(SBModeViewController*, SEL); 

#line 5 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"



static void _logos_method$_ungrouped$SBModeViewController$hostWillPresent(SBModeViewController* self, SEL _cmd) {
    int index = 0;

    if([[self viewControllers] count] > 1)
    {
        if( [[[[self viewControllers] objectAtIndex:1] orderedSectionIDs] count] != 0 )
        {
            index = 1;
        }

        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }

	_logos_orig$_ungrouped$SBModeViewController$hostWillPresent(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBModeViewController = objc_getClass("SBModeViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBModeViewController, @selector(hostWillPresent), (IMP)&_logos_method$_ungrouped$SBModeViewController$hostWillPresent, (IMP*)&_logos_orig$_ungrouped$SBModeViewController$hostWillPresent);} }
#line 25 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"
