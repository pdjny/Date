//
//  main.m
//  Date
//
//  Created by PHILIP JACOBS on 6/14/13.
//  Copyright (c) 2013 PHILIP JACOBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateAppDelegate.h"
#import "Date.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
		//Demonstrate that we can call a class method
		//even when no objects of the class currently exist.
		NSLog(@"There are %d months in a year", Date.yearLength);
		
		//Call the init method that takes no arguments.
		Date *today = [[Date alloc] init];
		
		//Call the description method two different ways
		//these bothwork, but only for the description method
		//which is inherited from the superclass
		today.reminder = @"and don't you forget it!";
		NSLog(@"Description:%@", [today description]);
		NSLog(@"Description:%@", today);
		
		//Use the day, month and year getter methods as well as the monthLength method
		NSLog(@"Today is day %d out of %d of month %d in the year %d", [today day], [today monthLength], [today month], [today year]);
		
		//Two different ways to call a getter
		NSLog(@"The day is %d", [today day]);
		NSLog(@"The day is %d",today.day);
		
		//Two different ways to call a setter (and also the getter)
		[today setDay: 1];
		NSLog(@"Does day = 1: %d", [today day]);
		today.day = 2;
		NSLog(@"Does day = 2: %d", today.day);
		
		//Test the implementation of the 'next' method
		[today next];
		NSLog(@"Does day = 3: %d/%d/%d", today.month, today.day, today.year);


		//Test the implementation of the 'next:' method
		[today next: 5];
		NSLog(@"Does day = 8: %@", today);
		[today next: 35];
		NSLog(@"Did month increment: %@", today);
		[today next: 365];
		NSLog(@"Did year increment: %@", today);
		
		//Call the init method that takes three arguments.
		Date *independenceDay = [[Date alloc] initWithMonth: 7 day: 4 year: 1776];
		NSLog(@"Independence Day was %@", independenceDay);
		[independenceDay next: [independenceDay monthLength]];
		NSLog(@"One month after Independence Day was %@", independenceDay);
		
		//Call the init method that takes three arguments.
		Date *newYearsDay = [[Date alloc] initWithMonth: 1 day: 1 year: 2013];
		NSLog(@"New Years Day: %@", newYearsDay);
		[newYearsDay prev];
		NSLog(@"New Years Day: %@", newYearsDay);
		
		[newYearsDay prev: 31];
		NSLog(@"New Years Day: %@", newYearsDay);
		
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([DateAppDelegate class]));
	}
}
