#line 1 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"




#import <UIKit/UIKit.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBNotificationCenterWithSearchViewController; @class SBDashBoardViewController; @class SBModeViewController; 


#line 7 "/Users/jzplusplus/Documents/jailbreak/NCIfNeeded/NCIfNeeded/NCIfNeeded.xm"
static void (*_logos_orig$iOS11$SBDashBoardViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, bool); static void _logos_method$iOS11$SBDashBoardViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, bool); 



static void _logos_method$iOS11$SBDashBoardViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool b) {
    _logos_orig$iOS11$SBDashBoardViewController$viewWillAppear$(self, _cmd, b);
    
    if([self isMainPageVisible] && ![[[self mainPageContentViewController] combinedListViewController] hasContent])
    {
        [self activatePage:[self _indexOfTodayPage] animated:NO withCompletion:nil];
    }














}





static void (*_logos_orig$iOS10$SBNotificationCenterWithSearchViewController$willActivateHosting)(_LOGOS_SELF_TYPE_NORMAL SBNotificationCenterWithSearchViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$iOS10$SBNotificationCenterWithSearchViewController$willActivateHosting(_LOGOS_SELF_TYPE_NORMAL SBNotificationCenterWithSearchViewController* _LOGOS_SELF_CONST, SEL); 



static void _logos_method$iOS10$SBNotificationCenterWithSearchViewController$willActivateHosting(_LOGOS_SELF_TYPE_NORMAL SBNotificationCenterWithSearchViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$iOS10$SBNotificationCenterWithSearchViewController$willActivateHosting(self, _cmd);

    if([[[self notificationListViewController] sectionList] sectionCount] == 0)
    {
        [[self notificationAndTodayContainerView] scrollToPageAtIndex:0 animated:0];
    }
    else
    {
        [[self notificationAndTodayContainerView] scrollToPageAtIndex:1 animated:0];
    }
}



static void (*_logos_orig$preiOS10$SBModeViewController$hostWillPresent)(_LOGOS_SELF_TYPE_NORMAL SBModeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$preiOS10$SBModeViewController$hostWillPresent(_LOGOS_SELF_TYPE_NORMAL SBModeViewController* _LOGOS_SELF_CONST, SEL); 



static void _logos_method$preiOS10$SBModeViewController$hostWillPresent(_LOGOS_SELF_TYPE_NORMAL SBModeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    int index = 0;

    if([[self viewControllers] count] > 1)
    {
        if( [[[[self viewControllers] objectAtIndex:1] orderedSectionIDs] count] != 0 )
        {
            index = 1;
        }

        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }

    _logos_orig$preiOS10$SBModeViewController$hostWillPresent(self, _cmd);
}




static __attribute__((constructor)) void _logosLocalCtor_d89c9af8(int __unused argc, char __unused **argv, char __unused **envp) {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
        {Class _logos_class$iOS11$SBDashBoardViewController = objc_getClass("SBDashBoardViewController"); MSHookMessageEx(_logos_class$iOS11$SBDashBoardViewController, @selector(viewWillAppear:), (IMP)&_logos_method$iOS11$SBDashBoardViewController$viewWillAppear$, (IMP*)&_logos_orig$iOS11$SBDashBoardViewController$viewWillAppear$);}
    } else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        {Class _logos_class$iOS10$SBNotificationCenterWithSearchViewController = objc_getClass("SBNotificationCenterWithSearchViewController"); MSHookMessageEx(_logos_class$iOS10$SBNotificationCenterWithSearchViewController, @selector(willActivateHosting), (IMP)&_logos_method$iOS10$SBNotificationCenterWithSearchViewController$willActivateHosting, (IMP*)&_logos_orig$iOS10$SBNotificationCenterWithSearchViewController$willActivateHosting);}
    } else {
        {Class _logos_class$preiOS10$SBModeViewController = objc_getClass("SBModeViewController"); MSHookMessageEx(_logos_class$preiOS10$SBModeViewController, @selector(hostWillPresent), (IMP)&_logos_method$preiOS10$SBModeViewController$hostWillPresent, (IMP*)&_logos_orig$preiOS10$SBModeViewController$hostWillPresent);}
    }
}
