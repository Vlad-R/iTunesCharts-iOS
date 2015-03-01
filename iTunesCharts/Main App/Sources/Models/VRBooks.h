//
//  VRBooks.h
//  iTunesCharts
//
//  Created by Vlad-R on 21/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRList.h"


@interface VRBooks : VRList
@end


@interface VRBooksRequest : VRListRequest
@end


@interface VRFreeBooksRequest : VRBooksRequest
@end


@interface VRPaidBooksRequest : VRBooksRequest
@end


@interface VRTextbooksRequest : VRBooksRequest
@end
