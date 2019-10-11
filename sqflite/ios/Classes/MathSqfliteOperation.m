//
//  Operation.m
//  sqflite
//
//  Created by Alexandre Roux on 09/01/2018.
//

#import <Foundation/Foundation.h>
#import "MathSqfliteOperation.h"
#import "MathSqflitePlugin.h"

// Abstract
@implementation MathSqfliteOperation

- (NSString*)getMethod {
    return  nil;
}
- (NSString*)getSql {
    return nil;
}
- (NSArray*)getSqlArguments {
    return nil;
}
- (bool)getNoResult {
    return false;
}
- (bool)getContinueOnError {
    return false;
}
- (void)success:(NSObject*)results {}

- (void)error:(NSObject*)error {}

@end

@implementation MathSqfliteBatchOperation

@synthesize dictionary, results, error, noResult, continueOnError;

- (NSString*)getMethod {
    return [dictionary objectForKey:SqfliteParamMethod];
}

- (NSString*)getSql {
    return [dictionary objectForKey:SqfliteParamSql];
}

- (NSArray*)getSqlArguments {
    NSArray* arguments = [dictionary objectForKey:SqfliteParamSqlArguments];
    return [MathSqflitePlugin toSqlArguments:arguments];
}

- (bool)getNoResult {
    return noResult;
}

- (bool)getContinueOnError {
    return continueOnError;
}

- (void)success:(NSObject*)results {
    self.results = results;
}

- (void)error:(FlutterError*)error {
    self.error = error;
}

- (void)handleSuccess:(NSMutableArray*)results {
    if (![self getNoResult]) {
        // We wrap the result in 'result' map
        [results addObject:[NSDictionary dictionaryWithObject:((self.results == nil) ? [NSNull null] : self.results)
                                                       forKey:SqfliteParamResult]];
    }
}

// Encore the flutter error in a map
- (void)handleErrorContinue:(NSMutableArray*)results {
    if (![self getNoResult]) {
        // We wrap the error in an 'error' map
        NSMutableDictionary* error = [NSMutableDictionary new];
        error[SqfliteParamErrorCode] = self.error.code;
        if (self.error.message != nil) {
            error[SqfliteParamErrorMessage] = self.error.message;
        }
        if (self.error.details != nil) {
            error[SqfliteParamErrorData] = self.error.details;
        }
        [results addObject:[NSDictionary dictionaryWithObject:error
                                                       forKey:SqfliteParamError]];
    }
}

- (void)handleError:(FlutterResult)result {
    result(error);
}

@end

@implementation MathSqfliteMethodCallOperation

@synthesize flutterMethodCall;
@synthesize flutterResult;

+ (MathSqfliteMethodCallOperation*)newWithCall:(FlutterMethodCall*)flutterMethodCall result:(FlutterResult)flutterResult {
    MathSqfliteMethodCallOperation* operation = [MathSqfliteMethodCallOperation new];
    operation.flutterMethodCall = flutterMethodCall;
    operation.flutterResult = flutterResult;
    return operation;
}

- (NSString*)getMethod {
    return flutterMethodCall.method;
}

- (NSString*)getSql {
    return flutterMethodCall.arguments[SqfliteParamSql];
}

- (bool)getNoResult {
    NSNumber* noResult = flutterMethodCall.arguments[SqfliteParamNoResult];
    return [noResult boolValue];
}

- (bool)getContinueOnError {
    NSNumber* noResult = flutterMethodCall.arguments[SqfliteParamContinueOnError];
    return [noResult boolValue];
}

- (NSArray*)getSqlArguments {
    NSArray* arguments = flutterMethodCall.arguments[SqfliteParamSqlArguments];
    return [MathSqflitePlugin toSqlArguments:arguments];
}

- (void)success:(NSObject*)results {
    flutterResult(results);
}
- (void)error:(NSObject*)error {
    flutterResult(error);
}
@end
