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
                                          imageURL: "https://media.npr.org/assets/img/2020/06/30/ljd-famtree-01artboard-1-f561cbf9ff3685a63820fd082cdf6674a455465c.jpg?s=1400")

private let podcastItem2 = PodcastItemDTO(id: "884080764",
                                          title: "They Don't Say Our Names Enough",
                                          contentText: "This year, Pride Month intersects with a surge of protests against racism and police brutality. So this week, courtesy of The Nod podcast, we're looking back at the life of Storme DeLarverie — a Black butch woman who didn't pull any punches when it came to protecting her community from violence.",
                                          imageURL: "https://media.npr.org/assets/img/2020/06/26/08_eric_brittany_duo_look03_030r_slide-4a5fc46c18317f2571605a0c1dacfd6b80ddb99b.jpg?s=1400")


// This is a snapshot of the actual JSON response, to use for preview purposes.
private let jsonPayload = """

      "id": "885179622",
      "title": "We Aren't Who We Think We Are",
      "content_text": "Every family has a myth about who they are and where they came from. And there are a lot of reasons people tell these stories. Sometimes it's to make your family seem like they were part of an important historical event. Other times, it's to hide something that is too painful to talk about. That last point can be especially true for African American families.",
      "content_html": "<p>Every family has a myth about who they are and where they came from. And there are a lot of reasons people tell these stories. Sometimes it's to make your family seem like they were part of an important historical event. Other times, it's to hide something that is too painful to talk about. That last point can be especially true for African American families.</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=885179622' />",
      "image": "https://media.npr.org/assets/img/2020/06/30/ljd-famtree-01artboard-1-f561cbf9ff3685a63820fd082cdf6674a455465c.jpg?s=1400",
      "date_published": "2020-07-01T14:24:51-04:00",
      "date_modified": "2020-07-01T17:24:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-podcasts/podcast/npr/codeswitch/2020/07/20200701_codeswitch_final_storylab_mix-9a0e046e-97da-4243-95da-eaa6d8ef4338.mp3?orgId=1&d=2503&p=510312&story=885179622&t=podcast&e=885179622&size=39958782&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=885179622",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "39958782"
          },
          "duration_in_seconds": 2503
        }
      ]
    },
    {
      "id": "884080764",
      "title": "They Don't Say Our Names Enough",
      "content_text": "This year, Pride Month intersects with a surge of protests against racism and police brutality. So this week, courtesy of The Nod podcast, we're looking back at the life of Storme DeLarverie — a Black butch woman who didn't pull any punches when it came to protecting her community from violence.",
      "content_html": "<p>This year, Pride Month intersects with a surge of protests against racism and police brutality. So this week, courtesy of The Nod podcast, we're looking back at the life of Storme DeLarverie — a Black butch woman who didn't pull any punches when it came to protecting her community from violence. </p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=884080764' />",
      "image": "https://media.npr.org/assets/img/2020/06/26/08_eric_brittany_duo_look03_030r_slide-4a5fc46c18317f2571605a0c1dacfd6b80ddb99b.jpg?s=1400",
      "date_published": "2020-06-27T00:00:12-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-mp3/npr/codeswitch/2020/06/20200626_codeswitch_final_the_nod_storme.mp3?orgId=1&d=1721&p=510312&story=884080764&t=podcast&e=884080764&size=27488640&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=884080764",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "27488640"
          },
          "duration_in_seconds": 1721
        }
      ]
    },
    {
      "id": "882551486",
      "title": "The Undocumented Americans",
      "content_text": "In her new book, The Undocumented Americans, Karla Cornejo Villavicencio writes about delivery men, housekeepers, and day laborers — the undocumented immigrants who are often ignored while the media focuses its attention on Dreamers. \"I wanted to learn about them as the weirdos we all are outside of our jobs,\" she writes.",
      "content_html": "<p>In her new book, <em>The Undocumented Americans</em>, Karla Cornejo Villavicencio writes about delivery men, housekeepers, and day laborers — the undocumented immigrants who are often ignored while the media focuses its attention on Dreamers. \"I wanted to learn about them as the weirdos we all are outside of our jobs,\" she writes.</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=882551486' />",
      "image": "https://media.npr.org/assets/img/2020/06/23/karla-0eeda5bc69d095f5dcbbbdb5a3de1588a80a25f3.jpg?s=1400",
      "date_published": "2020-06-24T00:08:11-04:00",
      "date_modified": "2020-06-26T14:26:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-mp3/npr/codeswitch/2020/06/20200623_codeswitch_karla_mix_ljd_1133pm.mp3?orgId=1&d=1420&p=510312&story=882551486&t=podcast&e=882551486&size=22325763&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=882551486",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "22325763"
          },
          "duration_in_seconds": 1420
        }
      ]
    },
    {
      "id": "880878932",
      "title": "DACA Decision: Check-In With Miriam Gonzalez",
      "content_text": "When the Supreme Court ruled on Thursday that DACA could remain in place, recipient Miriam Gonzalez was relieved. As a plaintiff in the case, she's been fighting to keep the program alive since 2017 and we've been following her story. In this bonus episode — an update on Miriam, and why this decision is such a big deal.",
      "content_html": "<p>When the Supreme Court ruled on Thursday that DACA could remain in place, recipient Miriam Gonzalez was relieved. As a plaintiff in the case, she's been fighting to keep the program alive since 2017 and we've been following her story. In this bonus episode — an update on Miriam, and why this decision is such a big deal. </p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=880878932' />",
      "summary": "When the Supreme Court ruled that DACA could remain in place, recipient and case plaintiff Miriam Gonzalez was relieved. We talked to her right after she heard the news.",
      "image": "https://media.npr.org/assets/img/2020/06/19/imgl1865-fb26580160c8c19c7f2fcd3a1a6f841f4651d422.jpg?s=1400",
      "date_published": "2020-06-19T14:54:00-04:00",
      "date_modified": "2020-06-21T19:06:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-mp3/npr/codeswitch/2020/06/20200621_codeswitch_csdacadecisionfixed.mp3?orgId=1&d=1050&p=510312&story=880878932&t=podcast&e=880878932&size=10389972&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=880878932",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "10389972"
          },
          "duration_in_seconds": 1050
        }
      ]
    },
    {
      "id": "878963732",
      "title": "Why Now, White People?",
      "content_text": "The video is horrific, and the brutality is stark. But that was the case in Ferguson, Mo., in 2014 and Minnesota in 2016. This time, though, white people are out in the streets in big numbers, and books such as \"So You Want to Talk About Race\" and \"How to Be an Antiracist\" top the bestseller lists. So we asked some white people: What's different this time?",
      "content_html": "<p>The video is horrific, and the brutality is stark. But that was the case in Ferguson, Mo., in 2014 and Minnesota in 2016. This time, though, white people are out in the streets in big numbers, and books such as \"So You Want to Talk About Race\" and \"How to Be an Antiracist\" top the bestseller lists. So we asked some white people: What's different this time?</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=878963732' />",
      "summary": "White people are speaking up against racism and showing up to #BlackLivesMatter protests in numbers we haven't seen before. So we asked some of them: What's different this time?",
      "image": "https://media.npr.org/assets/img/2020/06/16/lajohnson-nprcs-whitepplstandup_custom-f8b54b4a0388aeb24154bb961aa58c6b667c2567.jpg?s=1400",
      "date_published": "2020-06-16T23:55:07-04:00",
      "date_modified": "2020-06-17T13:30:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-podcasts/podcast/npr/codeswitch/2020/06/20200616_codeswitch_why_now_final_mix-18b471c6-e7b5-41f3-946a-354d5319b898.mp3?orgId=1&d=1729&p=510312&story=878963732&t=podcast&e=878963732&size=27613914&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=878963732",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "27613914"
          },
          "duration_in_seconds": 1729
        }
      ]
    },
    {
      "id": "875593002",
      "title": "Bonus Episode: 'Not Just Another Protest'",
      "content_text": "Suffice it to say, the past few weeks have been a lot to unpack. So today, we're bringing you a special bonus episode from our friends at It's Been a Minute with Sam Sanders. The podcast explores how protests have changed over time, and how certain people's thoughts about race are evolving.",
      "content_html": "<p>Suffice it to say, the past few weeks have been a lot to unpack. So today, we're bringing you a special bonus episode from our friends at It's Been a Minute with Sam Sanders. The podcast explores how protests have changed over time, and how certain people's thoughts about race are evolving.</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=875593002' />",
      "image": "https://media.npr.org/assets/img/2020/06/12/ap_20156116027490_wide-5a88914fc49c6fd85e57dcaac5d9c0cc896e0a10.jpg?s=1400",
      "date_published": "2020-06-12T08:53:53-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-mp3/npr/codeswitch/2020/06/20200612_codeswitch_cs_ibam_protests_full_mix.mp3?orgId=1&d=2532&p=510312&story=875593002&t=podcast&e=875593002&size=40434822&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=875593002",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "40434822"
          },
          "duration_in_seconds": 2532
        }
      ]
    },
    {
      "id": "873592665",
      "title": "Unmasking The 'Outside Agitator'",
      "content_text": "Whenever a protest boils up, it's a safe bet that public officials will quickly blame any violence or disruption on \"outside agitators.\" But what, exactly, does it mean to be an agitator? And can these mysterious outsiders be a force for good?",
      "content_html": "<p>Whenever a protest boils up, it's a safe bet that public officials will quickly blame any violence or disruption on \"outside agitators.\" But what, exactly, does it mean to be an agitator? And can these mysterious outsiders be a force for good?</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=873592665' />",
      "image": "https://media.npr.org/assets/img/2020/06/09/nprcodeswitch-agitatortrope-0ce75ed8f8076faae7d3e6b12c734beb4362e433.jpg?s=1400",
      "date_published": "2020-06-10T00:11:00-04:00",
      "date_modified": "2020-06-10T11:36:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-podcasts/podcast/npr/codeswitch/2020/06/20200610_codeswitch_outside_agitators_full_mix_with_xpromos-951c02dd-f0ad-4658-9bef-3cc6b2634492.mp3?orgId=1&d=1747&p=510312&story=873592665&t=podcast&e=873592665&size=27889134&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=873592665",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "27889134"
          },
          "duration_in_seconds": 1747
        }
      ]
    },
    {
      "id": "865261916",
      "title": "A Decade Of Watching Black People Die",
      "content_text": "The last few weeks have been filled with devastating news — stories about the police killing black people. At this point, these calamities feel familiar — so familiar, in fact, that their details have begun to echo each other.",
      "content_html": "<p>The last few weeks have been filled with devastating news — stories about the police killing black people. At this point, these calamities feel familiar — so familiar, in fact, that their details have begun to echo each other.</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=865261916' />",
      "image": "https://media.npr.org/assets/img/2020/06/11/nprcodeswitch-saytheirname-v4_custom-39ff537f02116ab60e7ba0692c684268473028ac.jpg?s=1400",
      "date_published": "2020-05-31T11:15:00-04:00",
      "date_modified": "2020-06-11T10:18:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-podcasts/podcast/npr/codeswitch/2020/05/20200529_codeswitch_actual_final-e4eaafff-48c1-4b76-bfe5-87c4c4846242.mp3?orgId=1&d=1357&p=510312&story=865261916&t=podcast&e=865261916&size=21671664&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=865261916",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "21671664"
          },
          "duration_in_seconds": 1357
        }
      ]
    },
    {
      "id": "862386172",
      "title": "Songs Giving Us (Much Needed) Life",
      "content_text": "Talking about race can get real heavy, real fast. Listening to music is one way people have been lightening the mood and sorting through their feelings. So this week, we're sharing some of the songs that are giving all of us life during this especially taxing moment.",
      "content_html": "<p>Talking about race can get real heavy, real fast. Listening to music is one way people have been lightening the mood and sorting through their feelings. So this week, we're sharing some of the songs that are giving all of us life during this especially taxing moment.</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=862386172' />",
      "summary": "Talking about race can get real heavy, real fast. Listening to music is one way people have been lightening the mood and sorting through their feelings.",
      "image": "https://media.npr.org/assets/img/2020/05/26/homepage-adurand-spotifyplaylist1-e1bb1f9b31eba00eb8a73be98160d80ef455a0f3.jpg?s=1400",
      "date_published": "2020-05-26T22:45:53-04:00",
      "date_modified": "2020-05-29T14:05:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-podcasts/podcast/npr/codeswitch/2020/05/20200526_codeswitch_final_songs-4c61bb5e-b021-4c01-9f45-702e669c651b.mp3?orgId=1&d=1416&p=510312&story=862386172&t=podcast&e=862386172&size=22613667&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=862386172",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "22613667"
          },
          "duration_in_seconds": 1416
        }
      ]
    },
    {
      "id": "859131500",
      "title": "COVID Diaries: Jessica And Sean Apply For A Loan",
      "content_text": "On March 1, two Los Angeles-based capoeira instructors realized a dream almost 15 years in the making — they opened up their very own gym. Two weeks later, California's stay-at-home order went into effect, and the gym shut its doors. This week, we follow the two of them as they navigate how to keep their dream alive in the midst of the coronavirus pandemic.",
      "content_html": "<p>On March 1, two Los Angeles-based capoeira instructors realized a dream almost 15 years in the making — they opened up their very own gym. Two weeks later, California's stay-at-home order went into effect, and the gym shut its doors. This week, we follow the two of them as they navigate how to keep their dream alive in the midst of the coronavirus pandemic.</p><img src='https://media.npr.org/include/images/tracking/npr-rss-pixel.png?story=859131500' />",
      "summary": "On March 1, two Los Angeles capoeira teachers signed an expensive lease on their new gym. Two weeks later, they had to close their doors due to the pandemic. ",
      "image": "https://media.npr.org/assets/img/2020/05/19/dpendergast-small_business_final_custom-855587cfd71435ef355afefded0119c9bdb47cf3.jpg?s=1400",
      "date_published": "2020-05-20T12:17:25-04:00",
      "date_modified": "2020-06-17T14:29:00-04:00",
      "attachments": [
        {
          "url": "https://play.podtrac.com/npr-510312/edge1.pod.npr.org/anon.npr-podcasts/podcast/npr/codeswitch/2020/05/20200520_codeswitch_covid_diaries_poc_biz_and_econ__-_ljd_1146am_mix-4ca8e00a-7d5e-4ace-a491-f6c9458ebf0b-422f8059-fd66-4ac2-8e7d-588e51275060.mp3?orgId=1&d=2047&p=510312&story=859131500&t=podcast&e=859131500&size=32680079&ft=pod&f=510312&awCollectionId=510312&awEpisodeId=859131500",
          "mime_type": "audio/mpeg",
          "size_in_bytes": {
            "0": "32680079"
          },
          "duration_in_seconds": 2047
        }
      ]
    }
  ]
}
""".data(using: .utf8)!
