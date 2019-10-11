//
//  Operation.h
//  sqflite
//
//  Created by Alexandre Roux on 09/01/2018.
//
#import <Flutter/Flutter.h>

#ifndef MathSqfliteOperation_h
#define MathSqfliteOperation_h

@interface MathSqfliteOperation : NSObject

- (NSString*)getMethod;
- (NSString*)getSql;
- (NSArray*)getSqlArguments;
- (void)success:(NSObject*)results;
- (void)error:(FlutterError*)error;
- (bool)getNoResult;
- (bool)getContinueOnError;

@end

@interface MathSqfliteBatchOperation : MathSqfliteOperation

@property (atomic, retain) NSDictionary* dictionary;
@property (atomic, retain) NSObject* results;
@property (atomic, retain) FlutterError* error;
@property (atomic, assign) bool noResult;
@property (atomic, assign) bool continueOnError;

- (void)handleSuccess:(NSMutableArray*)results;
- (void)handleErrorContinue:(NSMutableArray*)results;
- (void)handleError:(FlutterResult)result;

@end

@interface MathSqfliteMethodCallOperation : MathSqfliteOperation

@property (atomic, retain) FlutterMethodCall* flutterMethodCall;
@property (atomic, assign) FlutterResult flutterResult;

+ (MathSqfliteMethodCallOperation*)newWithCall:(FlutterMethodCall*)flutterMethodCall result:(FlutterResult)flutterResult;

@end

#endif /* SqfliteOperation_h */
