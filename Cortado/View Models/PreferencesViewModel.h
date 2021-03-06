#import <ReactiveViewModel/ReactiveViewModel.h>

@class Drink;
@class DrinkCellViewModel;
@class Preferences;

@interface PreferencesViewModel : RVMViewModel

@property (readonly, nonatomic, strong) Preferences *preferences;
@property (readonly) NSUInteger numberOfDrinks;
@property (readonly) BOOL canAddMore;

@property (readwrite, nonatomic, assign) BOOL shouldRegisterNotificationTypeAutomatically;

- (void)registerNotificationType;

- (Drink *)drinkAtIndex:(NSUInteger)index;
- (DrinkCellViewModel *)drinkViewModelAtIndex:(NSUInteger)index;

- (void)addDrink:(Drink *)drink;
- (void)removeDrinkAtIndex:(NSUInteger)index;
- (void)moveDrinkAtIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2;
- (void)replaceDrinkAtIndex:(NSUInteger)index withDrink:(Drink *)drink;

@end
