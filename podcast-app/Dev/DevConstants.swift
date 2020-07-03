//
//  DevConstants.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/2/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import Foundation

let lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."



let podcastPreviewPage = PodcastPageDTO(feedUrl: "",
                                        title: "Podcast title",
                                        homePageUrl: "",
                                        nextUrl: "",
                                        description: "Description \(lorem_ipsum)",
    coverArtUrl: "https://media.npr.org/assets/img/2020/03/24/undefined_sq-63f9f4b46bb9031d67f9785b66818f4befbab8bc.jpg?s=1400",
    podcasts: [podcastItem1, podcastItem2])


let podcastItem1 = PodcastItemDTO(id: "885179622",
                                          title: "We Aren't Who We ",
                                          contentText: "Every family has a myth about who they are and where they came from. And there are a lot of reasons people tell these stories. Sometimes it's to make your family seem like they were part of an important historical event. Other times, it's to hide something that is too painful to talk about. That last point can be especially true for African American families.",
                                          imageURL: "https://media.npr.org/assets/img/2020/06/30/ljd-famtree-01artboard-1-f561cbf9ff3685a63820fd082cdf6674a455465c.jpg?s=1400", playbackItems: [playbackInfo1])

private let podcastItem2 = PodcastItemDTO(id: "884080764",
                                          title: "They Don't Say Our Names Enough",
                                          contentText: "This year, Pride Month intersects with a surge of protests against racism and police brutality. So this week, courtesy of The Nod podcast, we're looking back at the life of Storme DeLarverie — a Black butch woman who didn't pull any punches when it came to protecting her community from violence.",
                                          imageURL: "https://media.npr.org/assets/img/2020/06/26/08_eric_brittany_duo_look03_030r_slide-4a5fc46c18317f2571605a0c1dacfd6b80ddb99b.jpg?s=1400", playbackItems: [playbackInfo2])


private let playbackInfo1 = PlaybackDTO(url: "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-podcasts/podcast/npr/codeswitch/2020/07/20200701_codeswitch_final_storylab_mix-9a0e046e-97da-4243-95da-eaa6d8ef4338.mp3?orgId=1&d=2503&p=510312&story=885179622&t=podcast&e=885179622&size=39958782&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=885179622", durationInSeconds: 2503)


private let playbackInfo2 = PlaybackDTO(url: "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-mp3/npr/codeswitch/2020/06/20200626_codeswitch_final_the_nod_storme.mp3?orgId=1&d=1721&p=510312&story=884080764&t=podcast&e=884080764&size=27488640&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=884080764", durationInSeconds: 1721)
