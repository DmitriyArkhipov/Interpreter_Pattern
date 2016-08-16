//
//  ViewController.m
//  interpreter_pattern
//
//  Created by Dmitriy Arkhipov on 16.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ViewController.h"

#import "InterpreterPattern.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     (клиентская часть)
     строит предложения языка с данной грамматикой в виде абстрактного синтаксического дерева, 
     узлами которого являются объекты TerminalExpression и NonterminalExpression
     */
    
    
    Context *context = [[Context alloc] init];
    
    //опр. набор переменных
    
    int x = 5;
    int y = 8;
    int z = 2;
    
    //добавление переменных в контекст
    
    [context setVariableWithName:@"x" AndValue:x];
    [context setVariableWithName:@"y" AndValue:y];
    [context setVariableWithName:@"z" AndValue:z];
    
    //созд объекта для вычисления выражения x + y - z
    
    
    id numberX = [[NumberExpression alloc] initWithVariableName:@"x"];
    id numberY = [[NumberExpression alloc] initWithVariableName:@"y"];
    id numberZ = [[NumberExpression alloc] initWithVariableName:@"z"];
    
    id rightExpression = [[AddExpression alloc] initWithLeft:numberX right:numberY];
    
    
    id expression = [[SubtractExpression alloc] initWithLeft:rightExpression right:numberZ];
    
    int result = [expression interpretContext:context];
    
    NSLog(@"bot result = %i ", result);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
