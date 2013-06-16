//
//  Date.h
//  Date
//
//  Created by PHILIP JACOBS on 6/14/13.
//  Copyright (c) 2013 PHILIP JACOBS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject {
	int year;
	int month;
	int day;
}

- (id) initWithMonth: (int) m day: (int) d year: (int) y;
- (int) monthLength;
- (int) day;
- (int) month;
- (int) year;
- (void) setDay: (int) d;
- (void) setMonth: (int) m;
- (void) setYear: (int) y;
- (void) next;
- (void) next: (int) distance;
- (void) prev;
- (void) prev: (int) distance;
+ (int) yearLength;

@property (nonatomic, strong) NSString *reminder;

@end
