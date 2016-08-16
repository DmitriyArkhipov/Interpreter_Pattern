//
//  InterpreterPattern.h
//  interpreter_pattern
//
//  Created by Dmitriy Arkhipov on 16.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//  Пример реализации паттерна "Интерпретатор (Interpreter)"

#import <Foundation/Foundation.h>



/**
 содержит общую для интерпретатора информацию. 
 Может использоваться объектами терминальных и 
 нетерминальных выражений для сохранения состояния 
 операций и последующего доступа к сохраненному состоянию
 */
@interface Context : NSObject


@property (strong, nonatomic) NSMutableDictionary *variables;

- (int) getVariable:(NSString *)name;

- (void) setVariableWithName:(NSString *)name AndValue:(int)value;

@end


//протокол интерпретатора
@protocol IExpression <NSObject>

- (int) interpretContext:(Context *)context;

@end

/**
 терминальное выражение, реализует метод Interpret() для терминальных символов грамматики. 
 Для каждого символа грамматики создается свой объект TerminalExpression
 */
@interface NumberExpression : NSObject <IExpression>

/**
 имя переменной
 */
@property (strong, nonatomic) NSString *name;

- (instancetype) initWithVariableName:(NSString *)name;

- (int) interpretContext:(Context *)context;

@end

/**
 нетерминальное выражение, представляет правило грамматики. 
 Для каждого отдельного правила грамматики создается свой объект NonterminalExpression.
 */
@interface AddExpression : NSObject <IExpression>

@property (strong, nonatomic) id<IExpression> leftExpression;
@property (strong, nonatomic) id<IExpression> rightExpression;


- (instancetype) initWithLeft:(id<IExpression>)leftExpression right:(id<IExpression>)right;

- (int) interpretContext:(Context *)context;

@end

/**
 нетерминальное выражение, представляет правило грамматики. 
 Для каждого отдельного правила грамматики создается свой объект NonterminalExpression.
 */
@interface SubtractExpression : NSObject <IExpression>

@property (strong, nonatomic) id<IExpression> leftExpression;
@property (strong, nonatomic) id<IExpression> rightExpression;


- (instancetype) initWithLeft:(id<IExpression>)leftExpression right:(id<IExpression>)right;

- (int) interpretContext:(Context *)context;

@end