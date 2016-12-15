#import "IFLineariconsFree.h"

@implementation IFLineariconsFree

+ (NSURL *)fontFileURL
{
    return [[[NSBundle mainBundle] resourceURL] URLByAppendingPathComponent:@"Linearicons-Free.ttf"];
}

+ (NSDictionary *)allIcons
{
    return @{
             @"lnr-home":                                @"\ue800",
             @"lnr-apartment":                           @"\ue801",
             @"lnr-pencil":                              @"\ue802",
             @"lnr-magic-wand":                          @"\ue803",
             @"lnr-drop":                                @"\ue804",
             @"lnr-lighter":                             @"\ue805",
             @"lnr-poop":                                @"\ue806",
             @"lnr-sun":                                 @"\ue807",
             @"lnr-moon":                                @"\ue808",
             @"lnr-cloud":                               @"\ue809",
             @"lnr-cloud-upload":                        @"\ue80a",
             @"lnr-cloud-download":                      @"\ue80b",
             @"lnr-cloud-sync":                          @"\ue80c",
             @"lnr-cloud-check":                         @"\ue80d",
             @"lnr-database":                            @"\ue80e",
             @"lnr-lock":                                @"\ue80f",
             @"lnr-cog":                                 @"\ue810",
             @"lnr-trash":                               @"\ue811",
             @"lnr-dice":                                @"\ue812",
             @"lnr-heart":                               @"\ue813",
             @"lnr-star":                                @"\ue814",
             @"lnr-star-half":                           @"\ue815",
             @"lnr-star-empty":                          @"\ue816",
             @"lnr-flag":                                @"\ue817",
             @"lnr-envelope":                            @"\ue818",
             @"lnr-paperclip":                           @"\ue819",
             @"lnr-inbox":                               @"\ue81a",
             @"lnr-eye":                                 @"\ue81b",
             @"lnr-printer":                             @"\ue81c",
             @"lnr-file-empty":                          @"\ue81d",
             @"lnr-file-add":                            @"\ue81e",
             @"lnr-enter":                               @"\ue81f",
             @"lnr-exit":                                @"\ue820",
             @"lnr-graduation-hat":                      @"\ue821",
             @"lnr-license":                             @"\ue822",
             @"lnr-music-note":                          @"\ue823",
             @"lnr-film-play":                           @"\ue824",
             @"lnr-camera-video":                        @"\ue825",
             @"lnr-camera":                              @"\ue826",
             @"lnr-picture":                             @"\ue827",
             @"lnr-book":                                @"\ue828",
             @"lnr-bookmark":                            @"\ue829",
             @"lnr-user":                                @"\ue82a",
             @"lnr-users":                               @"\ue82b",
             @"lnr-shirt":                               @"\ue82c",
             @"lnr-store":                               @"\ue82d",
             @"lnr-cart":                                @"\ue82e",
             @"lnr-tag":                                 @"\ue82f",
             @"lnr-phone-handset":                       @"\ue830",
             @"lnr-phone":                               @"\ue831",
             @"lnr-pushpin":                             @"\ue832",
             @"lnr-map-marker":                          @"\ue833",
             @"lnr-map":                                 @"\ue834",
             @"lnr-location":                            @"\ue835",
             @"lnr-calendar-full":                       @"\ue836",
             @"lnr-keyboard":                            @"\ue837",
             @"lnr-spell-check":                         @"\ue838",
             @"lnr-screen":                              @"\ue839",
             @"lnr-smartphone":                          @"\ue83a",
             @"lnr-tablet":                              @"\ue83b",
             @"lnr-laptop":                              @"\ue83c",
             @"lnr-laptop-phone":                        @"\ue83d",
             @"lnr-power-switch":                        @"\ue83e",
             @"lnr-bubble":                              @"\ue83f",
             @"lnr-heart-pulse":                         @"\ue840",
             @"lnr-construction":                        @"\ue841",
             @"lnr-pie-chart":                           @"\ue842",
             @"lnr-chart-bars":                          @"\ue843",
             @"lnr-gift":                                @"\ue844",
             @"lnr-diamond":                             @"\ue845",
             @"lnr-linearicons":                         @"\ue846",
             @"lnr-dinner":                              @"\ue847",
             @"lnr-coffee-cup":                          @"\ue848",
             @"lnr-leaf":                                @"\ue849",
             @"lnr-paw":                                 @"\ue84a",
             @"lnr-rocket":                              @"\ue84b",
             @"lnr-briefcase":                           @"\ue84c",
             @"lnr-bus":                                 @"\ue84d",
             @"lnr-car":                                 @"\ue84e",
             @"lnr-train":                               @"\ue84f",
             @"lnr-bicycle":                             @"\ue850",
             @"lnr-wheelchair":                          @"\ue851",
             @"lnr-select":                              @"\ue852",
             @"lnr-earth":                               @"\ue853",
             @"lnr-smile":                               @"\ue854",
             @"lnr-sad":                                 @"\ue855",
             @"lnr-neutral":                             @"\ue856",
             @"lnr-mustache":                            @"\ue857",
             @"lnr-alarm":                               @"\ue858",
             @"lnr-bullhorn":                            @"\ue859",
             @"lnr-volume-high":                         @"\ue85a",
             @"lnr-volume-medium":                       @"\ue85b",
             @"lnr-volume-low":                          @"\ue85c",
             @"lnr-volume":                              @"\ue85d",
             @"lnr-mic":                                 @"\ue85e",
             @"lnr-hourglass":                           @"\ue85f",
             @"lnr-undo":                                @"\ue860",
             @"lnr-redo":                                @"\ue861",
             @"lnr-sync":                                @"\ue862",
             @"lnr-history":                             @"\ue863",
             @"lnr-clock":                               @"\ue864",
             @"lnr-download":                            @"\ue865",
             @"lnr-upload":                              @"\ue866",
             @"lnr-enter-down":                          @"\ue867",
             @"lnr-exit-up":                             @"\ue868",
             @"lnr-bug":                                 @"\ue869",
             @"lnr-code":                                @"\ue86a",
             @"lnr-link":                                @"\ue86b",
             @"lnr-unlink":                              @"\ue86c",
             @"lnr-thumbs-up":                           @"\ue86d",
             @"lnr-thumbs-down":                         @"\ue86e",
             @"lnr-magnifier":                           @"\ue86f",
             @"lnr-cross":                               @"\ue870",
             @"lnr-menu":                                @"\ue871",
             @"lnr-list":                                @"\ue872",
             @"lnr-chevron-up":                          @"\ue873",
             @"lnr-chevron-down":                        @"\ue874",
             @"lnr-chevron-left":                        @"\ue875",
             @"lnr-chevron-right":                       @"\ue876",
             @"lnr-arrow-up":                            @"\ue877",
             @"lnr-arrow-down":                          @"\ue878",
             @"lnr-arrow-left":                          @"\ue879",
             @"lnr-arrow-right":                         @"\ue87a",
             @"lnr-move":                                @"\ue87b",
             @"lnr-warning":                             @"\ue87c",
             @"lnr-question-circle":                     @"\ue87d",
             @"lnr-menu-circle":                         @"\ue87e",
             @"lnr-checkmark-circle":                    @"\ue87f",
             @"lnr-cross-circle":                        @"\ue880",
             @"lnr-plus-circle":                         @"\ue881",
             @"lnr-circle-minus":                        @"\ue882",
             @"lnr-arrow-up-circle":                     @"\ue883",
             @"lnr-arrow-down-circle":                   @"\ue884",
             @"lnr-arrow-left-circle":                   @"\ue885",
             @"lnr-arrow-right-circle":                  @"\ue886",
             @"lnr-chevron-up-circle":                   @"\ue887",
             @"lnr-chevron-down-circle":                 @"\ue888",
             @"lnr-chevron-left-circle":                 @"\ue889",
             @"lnr-chevron-right-circle":                @"\ue88a",
             @"lnr-crop":                                @"\ue88b",
             @"lnr-frame-expand":                        @"\ue88c",
             @"lnr-frame-contract":                      @"\ue88d",
             @"lnr-layers":                              @"\ue88e",
             @"lnr-funnel":                              @"\ue88f",
             @"lnr-text-format":                         @"\ue890",
             @"lnr-text-format-remove":                  @"\ue891",
             @"lnr-text-size":                           @"\ue892",
             @"lnr-bold":                                @"\ue893",
             @"lnr-italic":                              @"\ue894",
             @"lnr-underline":                           @"\ue895",
             @"lnr-strikethrough":                       @"\ue896",
             @"lnr-highlight":                           @"\ue897",
             @"lnr-text-align-left":                     @"\ue898",
             @"lnr-text-align-center":                   @"\ue899",
             @"lnr-text-align-right":                    @"\ue89a",
             @"lnr-text-align-justify":                  @"\ue89b",
             @"lnr-line-spacing":                        @"\ue89c",
             @"lnr-indent-increase":                     @"\ue89d",
             @"lnr-indent-decrease":                     @"\ue89e",
             @"lnr-pilcrow":                             @"\ue89f",
             @"lnr-direction-ltr":                       @"\ue8a0",
             @"lnr-direction-rtl":                       @"\ue8a1",
             @"lnr-page-break":                          @"\ue8a2",
             @"lnr-sort-alpha-asc":                      @"\ue8a3",
             @"lnr-sort-amount-asc":                     @"\ue8a4",
             @"lnr-hand":                                @"\ue8a5",
             @"lnr-pointer-up":                          @"\ue8a6",
             @"lnr-pointer-right":                       @"\ue8a7",
             @"lnr-pointer-down":                        @"\ue8a8",
             @"lnr-pointer-left":                        @"\ue8a9",
             };
}

@end
