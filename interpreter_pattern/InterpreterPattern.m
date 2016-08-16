//
//  InterpreterPattern.m
//  interpreter_pattern
//
//  Created by Dmitriy Arkhipov on 16.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "InterpreterPattern.h"

@implementation Context

- (instancetype) init {

    self = [super init];
    
    if (self) {
    
        _variables = [[NSMutableDictionary alloc] init];
    
    }
    
    return self;

}


- (int) getVariable:(NSString*)name {
//    
//    NSNumber *varObj = [_variables objectForKey:name];
//    
//    int variable = [varObj intValue];
    
    int variable = [[_variables objectForKey:name] intValue];
    
    return variable;
}


- (void) setVariableWithName:(NSString*)name AndValue:(int)value {

    [_variables setObject:[NSNumber numberWithInt:value] forKey:name];

}


@end

/**
 терминальное выражение, реализует метод Interpret() для терминальных символов грамматики. Для каждого символа грамматики создается свой объект TerminalExpression
 */
@implementation NumberExpression

- (instancetype) initWithVariableName:(NSString *)name {

    self = [super init];
    
    if (self) {
        _name = name;
    }

    return self;
}

- (int) interpretContext:(Context *)context {

    return [context getVariable:_name];

}


@end


@implementation AddExpression

- (instancetype) initWithLeft:(id<IExpression>)left right:(id<IExpression>)right {

    self = [super init];
    
    if (self) {
        _leftExpression = left;
        _rightExpression = right;
    }
    
    return self;
}

- (int) interpretContext:(Context *)context {

    int left = [_leftExpression interpretContext:context];
    int right = [_rightExpression interpretContext:context];
    
    return left + right;


}

@end



@implementation SubtractExpression

- (instancetype) initWithLeft:(id<IExpression>)left right:(id<IExpression>)right {
    
    self = [super init];
    
    if (self) {
        _leftExpression = left;
        _rightExpression = right;
    }
    
    return self;
}

- (int) interpretContext:(Context *)context {
    
    int left = [_leftExpression interpretContext:context];
    int right = [_rightExpression interpretContext:context];
    
    return left - right;
    
    
}

@end



