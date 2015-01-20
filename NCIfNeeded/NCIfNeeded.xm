
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

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
