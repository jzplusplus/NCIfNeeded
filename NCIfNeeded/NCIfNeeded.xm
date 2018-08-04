
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

%group iOS11
%hook SBDashBoardViewController

- (void)viewWillAppear: (bool)b
{
    %orig(b);
    
    if([self isMainPageVisible] && ![[[self mainPageContentViewController] combinedListViewController] hasContent])
    {
        [self activatePage:[self _indexOfTodayPage] animated:NO withCompletion:nil];
    }
//    id mainCombined = [[self mainPageContentViewController] combinedListViewController];
//    id ncCombined = MSHookIvar<id>(mainCombined, "_listViewController");
//
//    if([self isMainPageVisible])
//    {
//        if([[ncCombined notificationSectionList] sectionCount] == 0)
//        {
//            [self activatePage:[self _indexOfTodayPage] animated:NO withCompletion:nil];
//        }
//        else
//        {
//            [ncCombined forceNotificationHistoryRevealed:YES animated:YES];
//        }
//    }
}

%end
%end


%group iOS10
%hook SBNotificationCenterWithSearchViewController

- (void)willActivateHosting
{
    %orig;

    if([[[self notificationListViewController] sectionList] sectionCount] == 0)
    {
        [[self notificationAndTodayContainerView] scrollToPageAtIndex:0 animated:0];
    }
    else
    {
        [[self notificationAndTodayContainerView] scrollToPageAtIndex:1 animated:0];
    }
}
%end
%end

%group preiOS10
%hook SBModeViewController

- (void)hostWillPresent
{
    int index = 0;

    if([[self viewControllers] count] > 1)
    {
        if( [[[[self viewControllers] objectAtIndex:1] orderedSectionIDs] count] != 0 )
        {
            index = 1;
        }

        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }

    %orig;
}

%end
%end

%ctor {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
        %init(iOS11);
    } else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        %init(iOS10);
    } else {
        %init(preiOS10);
    }
}
