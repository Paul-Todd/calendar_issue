# calendar_issue

The project shows the issue with the calendar_day_view and slivers.

Please see issue https://github.com/samderlust/calendar_day_view/issues/4 for more background.

Whilst we can wrap the OverFlowCalendarDayView in a SliverToBoxAdapter the behaviour is not 
synchronized with the header and so we see that you manuallly have to shrink the header to get the list to function

The proposed patch adds a primary property to the OverFlowCalendarDayView control which allows the control to then
have its scroll behaviour controlled by the parent.

Toggle the switch on the app bar to see the difference in behavious. With the switch off the header shrink is manual 
and with it on the header shrink is automatic


## Todo
1. Clone calendar_day_view [done]
2. patch for primary property [done]
3. update ui test [done]