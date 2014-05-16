//
//  ViewController.h
//  calculadora
//
//  Created by Eduardo on 12/05/14.
//  Copyright (c) 2014 __FULLUSERNAME__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMathParser.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelValor;
@property (strong, nonatomic) NSString *val1;
@property (strong, nonatomic) NSString *operador;
@property (strong, nonatomic) NSString *val2;
@property (strong, nonatomic) NSString *valTotal;
@property (strong, nonatomic) IBOutlet UILabel *labelTotal;

-(IBAction)press:(id)sender;

- (IBAction)limpar:(id)sender;

-(void)atualizaTela;


- (IBAction)funcao:(id)sender;

-(IBAction)igual:(id)sender;



@end
