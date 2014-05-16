//
//  ViewController.m
//  calculadora
//
//  Created by Eduardo on 12/05/14.
//  Copyright (c) 2014 __FULLUSERNAME__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _val1 = @"";
    _operador = @"";
    _val2 = @"";
    _valTotal = @"";
    [self atualizaTela];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)press:(id)sender{
    UIButton *button = (UIButton *)sender;
    
    if([_operador isEqual:@"="]){
        [self limpar:sender];
    }
    
    if([_operador isEqual:@""]){
        _val1 = [NSString stringWithFormat:@"%@%@",_val1,button.titleLabel.text];
    }else{
        _val2 = [NSString stringWithFormat:@"%@%@",_val2,button.titleLabel.text];
    }
    [self atualizaTela];

}

- (IBAction)limpar:(id)sender {
    _val1 = @"";
    _val2 = @"";
    _operador = @"";
    _valTotal = @"";
    [self atualizaTela];
}

-(void)atualizaTela{
    if([_val1 isEqual:@""]){
        _labelValor.text = @"0";
    }else{
        if([_operador isEqual:@""]){
            _labelValor.text = _val1;
        }else{
            _labelValor.text = _val2;
        }
    }
    if(![_val1 isEqual:@""] && ![_operador isEqual:@""]){
        _valTotal = [NSString stringWithFormat:@"%@ %@",_val1,_operador];
        _labelTotal.text = _valTotal;
    }else{
        _labelTotal.text = @"";
    }
}

- (IBAction)funcao:(id)sender {
    UIButton *button = (UIButton *)sender;
    _operador = button.titleLabel.text;
    [self atualizaTela];
    
}


-(void)igual:(id)sender{
    if(![_val1 isEqual:@""] && ![_operador isEqual:@""] && ![_val2 isEqual:@""]){
        _operador = [_operador stringByReplacingOccurrencesOfString:@"X" withString:@"*"];
        _val1 = [_val1 stringByReplacingOccurrencesOfString:@"," withString:@"."];
        _val2 = [_val2 stringByReplacingOccurrencesOfString:@"," withString:@"."];
        NSString *string= [NSString stringWithFormat:@"%@%@%@", _val1,_operador,_val2];
        NSNumber *result = [string numberByEvaluatingString];
        float v = [result floatValue];
        
        NSString *decimal = @"%.05f";
        if((v - trunc(v))==0){
            decimal = @"%.f";
        }
        
        _val1 = [[NSString stringWithFormat:decimal, v]  stringByReplacingOccurrencesOfString:@"." withString:@","];
        _labelValor.text = _val1;
        _val2 = @"";
        _operador = @"";
        [self atualizaTela];
        _operador = @"=";
        
        //NSLog([NSString stringWithFormat:@"%.02f", v]);
        //NSExpression *expression = [NSExpression expressionWithFormat:string];
        //float result2 = [[expression expressionValueWithObject:nil context:nil] floatValue];
        //NSLog([NSString stringWithFormat:@"%.02f",result2]);
        //NSString *formatString = [NSString stringWithFormat:@"%%.%ldf", (long)5];
        //double result2 = [mathstring evaluateMath];
        //NSLog([NSString stringWithFormat:@"%5@",result]);
        
    }
}


@end
