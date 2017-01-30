
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

//iOS 10 and up
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

//Pre-iOS 10
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
