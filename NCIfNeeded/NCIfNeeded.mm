#line 1 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"




#import <UIKit/UIKit.h>


#include <logos/logos.h>
#include <substrate.h>
@class SBModeViewController; @class SBNotificationCenterWithSearchViewController; 
static void (*_logos_orig$_ungrouped$SBNotificationCenterWithSearchViewController$willActivateHosting)(SBNotificationCenterWithSearchViewController*, SEL); static void _logos_method$_ungrouped$SBNotificationCenterWithSearchViewController$willActivateHosting(SBNotificationCenterWithSearchViewController*, SEL); static void (*_logos_orig$_ungrouped$SBModeViewController$hostWillPresent)(SBModeViewController*, SEL); static void _logos_method$_ungrouped$SBModeViewController$hostWillPresent(SBModeViewController*, SEL); 

#line 8 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"



static void _logos_method$_ungrouped$SBNotificationCenterWithSearchViewController$willActivateHosting(SBNotificationCenterWithSearchViewController* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBNotificationCenterWithSearchViewController$willActivateHosting(self, _cmd);
    
    if([[[self notificationListViewController] sectionList] sectionCount] == 0)
    {
        [[self notificationAndTodayContainerView] scrollToPageAtIndex:0 animated:0];
    }
    else
    {
        [[self notificationAndTodayContainerView] scrollToPageAtIndex:1 animated:0];
    }
}






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
{Class _logos_class$_ungrouped$SBNotificationCenterWithSearchViewController = objc_getClass("SBNotificationCenterWithSearchViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBNotificationCenterWithSearchViewController, @selector(willActivateHosting), (IMP)&_logos_method$_ungrouped$SBNotificationCenterWithSearchViewController$willActivateHosting, (IMP*)&_logos_orig$_ungrouped$SBNotificationCenterWithSearchViewController$willActivateHosting);Class _logos_class$_ungrouped$SBModeViewController = objc_getClass("SBModeViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBModeViewController, @selector(hostWillPresent), (IMP)&_logos_method$_ungrouped$SBModeViewController$hostWillPresent, (IMP*)&_logos_orig$_ungrouped$SBModeViewController$hostWillPresent);} }
#line 46 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"
