//
//  webService.m
//  webServiceTutorial
//
//  Created by GABRIEL VIEIRA on 12/02/14.
//  Copyright (c) 2014 GABRIEL VIEIRA. All rights reserved.
//

#import "webService.h"

@implementation webService


+(NSString *)listar : (NSString *) id_aluno;
{
    
    NSString *url =  @"http://172.246.16.27/web_service/retorna.php";
   
    NSString *post = [NSString stringWithFormat:@"id_aluno=%@",id_aluno];

    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: [ NSURL URLWithString: url]];
    
    [ request setHTTPMethod: @"POST"];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    [ request setHTTPBody: postData ];
    NSURLResponse *response;
    NSError *err;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&err];
    
    //NSString *content = [NSString stringWithUTF8String:[returnData bytes]];

    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:returnData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSString *ret ;
    
    for (NSString *s in json) {
        ret = s;
    }
    
    return ret;
}

@end
