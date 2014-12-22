#import <ReactiveCocoa/ReactiveCocoa.h>

#import "HKHealthStore+ReactiveCocoa.h"

@implementation HKHealthStore (ReactiveCocoa)

- (RACSignal *)rac_queryWithSampleType:(HKSampleType *)sampleType
                         predicate:(NSPredicate *)predicate
                             limit:(NSUInteger)limit
                   sortDescriptors:(NSArray *)sortDescriptors {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        HKSampleQuery *query = [[HKSampleQuery alloc] initWithSampleType:sampleType
                                                               predicate:predicate
                                                                   limit:limit
                                                         sortDescriptors:sortDescriptors
                                                          resultsHandler:^(HKSampleQuery *query, NSArray *results, NSError *error) {
            if (error) {
              [subscriber sendError:error];
            }
            for (id result in results) {
                [subscriber sendNext:result];
            }
            [subscriber sendCompleted];
        }];
        [self executeQuery:query];
        
        return (RACDisposable *)nil;
    }];
}

@end
