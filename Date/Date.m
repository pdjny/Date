//
//  Date.m
//  Date
//
//  Created by PHILIP JACOBS on 6/14/13.
//  Copyright (c) 2013 PHILIP JACOBS. All rights reserved.
//

#import "Date.h"

@implementation Date
@synthesize reminder;

-(id) initWithMonth: (int) m day: (int) d year: (int) y {
	
	//Send the init message to the superclass object in myself.
	self = [super init];
	if (self) {
		self.year = y;
		self.month = m;
		self.day = d;
		
		//NSLog(@"initWithMonth:day:year.year = %d", year);
		//NSLog(@"initWithMonth:day:year.month = %d", month);
		//NSLog(@"initWithMonth:day:year.day = %d", day);
	}
	
	return self;
}


//Init Object
- (id) init {
	
	//Send the init message to the superclass object in myself.
	self = [super init];
	if (self) {
		//Get today's date
		NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
		NSDate *today = [[NSDate alloc] init];
		NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
		NSDateComponents *components = [calendar components: unitFlags fromDate: today];
		
		//NSLog(@"unitFlags = %d", unitFlags);
		
		year = components.year;
		month = components.month;
		day = components.day;
		reminder = @"";
		
		//NSLog(@"Year = %d", year);
		//NSLog(@"Month = %d", month);
		//NSLog(@"Day = %d", day);
		
	}
	return self;
}

- (int) monthLength {
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setYear: year];
	[components setMonth: month];
	[components setDay: day];
	NSRange range = [calendar rangeOfUnit: NSDayCalendarUnit inUnit: NSMonthCalendarUnit forDate: [calendar dateFromComponents: components]];
	//NSLog(@"Days in month: %d", range.length);
	
	return range.length;
}

- (NSString *) description {
	return [NSString stringWithFormat: @"%d/%d/%d %@", month, day, year, reminder];
}

- (int) day {
	return day;
}

- (int) month {
	return month;
}

- (int) year {
	return year;
}

- (void) setDay: (int) d {
	if (d < 1 || d > [self monthLength]) {
		NSLog(@"Invalid day passed to setDay: %d", d);
		return;
	}
	
	day = d;
	
}

- (void) setMonth: (int) m {
	//Is there a way to use the class method yearLength here insteat of hardcoding 12??
	if (m <1 || m > 12) {
		NSLog(@"Invalid month passed to setMonth: %d", m);
		return;
	}
	
	month = m;
}

- (void) setYear: (int) y {
	year = y;
}

//Advance the Date one day into the future.
//This method accepts no arguments.
- (void) next {
	if (day < [self monthLength]) {
		++day;
		return;
	}
	day = 1;
	
	if (month < 12) {
		++month;
		return;
	}
	
	month = 1;
	++year;
	
}

/*
 Advance the Date many days into the future.
 This method accepts one argument.
 It does the bulk of its work by calling the 'next' method over and over.
 */
- (void) next: (int) distance {
	if (distance < 0) {
		NSLog(@"next: requires an argument that is <= 0. Arg: %d", distance);
		return;
	}
	for (int i = 1; i <= distance; ++i) {
		[self next];
	}
}

//Decrement the Date one day into the past.
//This method accepts no arguments.
- (void) prev {
	if (day == 1 && month == 1) {
		month = 12;
		--year;
		day = [self monthLength];
		return;
	}
	
	if (day == 1) {
		--month;
		day = [self monthLength];
		return;
	}
	
	--day;
}

/*
 Decrement the Date many days into the past.
 This method accepts one argument.
 It does the bulk of its work by calling the 'prev' method over and over.
 */
- (void) prev: (int) distance {
	if (distance < 0) {
		NSLog(@"next: requires an argument that is <= 0. Arg: %d", distance);
		return;
	}
	for (int i = 1; i <= distance; ++i) {
		[self prev];
	}
}

// Return the number of months in a year.  A class method is marked with a plus.
+ (int) yearLength {
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
	NSRange range = [calendar rangeOfUnit: NSMonthCalendarUnit inUnit: NSYearCalendarUnit forDate: [[NSDate alloc] init]
	];

	return range.length;
}


@end
