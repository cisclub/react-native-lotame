
#import "RNLotame.h"
#import "RNLotame-Swift.h"

@implementation RNLotame

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(initialize: (NSString *)clientID) {
    [DMP initialize:clientID];
}

RCT_EXPORT_METHOD(startNewSession) {
    [DMP startNewSession];
}

RCT_EXPORT_METHOD(sendBehaviorDataWithHandler: (RCTResponseSenderBlock)callback) {
    [DMP sendBehaviorDataWithHandler:^(NSError * _Nullable error) {
        callback(@[error]);
    }];
}

RCT_EXPORT_METHOD(addBehaviorData: (NSString *)value forTypeKey: (NSString *)key) {
    [DMP addBehaviorData:value forType:key];
}

RCT_EXPORT_METHOD(addBehaviorDataWithBehaviorID: (double)ID) {
    [DMP addBehaviorDataWithBehaviorId:ID];
}

RCT_EXPORT_METHOD(addBehaviorDataWithopportunityID: (double)ID) {
    [DMP addBehaviorDataWithOpportunityId:ID];
}

RCT_EXPORT_METHOD(getAudienceDataWithHandler: (RCTResponseSenderBlock)callback) {
    [DMP getAudienceDataWithHandler:^(LotameProfile * _Nullable profile, BOOL success) {
        callback(@[@(success), profile]);
    }];
}


@end
  
