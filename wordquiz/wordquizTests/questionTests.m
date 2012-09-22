//
//  questionTests.m
//  wordquiz
//
//  Created by Saran on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "questionTests.h"
#import "Question.h"

@implementation questionTests

-(void)setUp
{
    
}

-(void)tearDown
{
    
}

-(void)testClassQuestionShouldReturnAllQuestions
{
    id questions = [Question arrayQuestions];
    STAssertNotNil(questions, @"questions should not be nil");
}

-(void)testClassQuestionShouldReturnQuestionsForGivenCategory
{
    id questions = [Question arrayQuestionsForCategoryName:@"Business"];
    STAssertNotNil(questions, @"questions should not be nil for business questions");
}

-(void)testClassQuestionShouldReturnQuestionsContainsGivenTitle
{
    id questions = [Question arrayQuestionsForQuestionTitleContains:@"countries"];

}
@end
