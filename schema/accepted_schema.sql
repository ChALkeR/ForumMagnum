-- GENERATED FILE
-- Do not edit this file directly. Instead, start a server and run "yarn makemigrations"
-- as described in the README. This file should nevertheless be checked in to version control.
--
-- Overall schema hash: 41d43ce0ce67110c70c251dca8e8899a

-- Accepted on 2022-10-21T09:19:15.000Z by 20221021T091915.schema_hash.ts

-- Schema for "AdvisorRequests", hash: 72f41d9d1d0ace5d33e970c79c0a2017
CREATE TABLE "AdvisorRequests" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "interestedInMetaculus" bool DEFAULT false,
    "jobAds" jsonb,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Bans", hash: aa0e91785a334ae16f46650e184a395a
CREATE TABLE "Bans" (
    _id varchar(27) PRIMARY KEY,
    "expirationDate" timestamptz,
    "userId" varchar(27),
    "ip" text,
    "reason" text,
    "comment" text,
    "properties" jsonb,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Books", hash: f7c58c313404e4c7f3e8dcd4406628e3
CREATE TABLE "Books" (
    _id varchar(27) PRIMARY KEY,
    "postedAt" timestamptz,
    "title" text,
    "subtitle" text,
    "collectionId" varchar(27) NOT NULL,
    "number" real,
    "postIds" varchar(27)[],
    "sequenceIds" varchar(27)[],
    "displaySequencesAsGrid" bool,
    "hideProgressBar" bool,
    "showChapters" bool,
    "contents" jsonb,
    "contents_latest" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Chapters", hash: c53dda62e52c2047ab5587afbc9e57ed
CREATE TABLE "Chapters" (
    _id varchar(27) PRIMARY KEY,
    "title" text,
    "subtitle" text,
    "number" real,
    "sequenceId" varchar(27),
    "postIds" varchar(27)[] NOT NULL,
    "contents" jsonb,
    "contents_latest" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "ClientIds", hash: 59358b2180a14ea11fb364878b50958e
CREATE TABLE "ClientIds" (
    _id varchar(27) PRIMARY KEY,
    "clientId" text,
    "firstSeenReferrer" text,
    "firstSeenLandingPage" text,
    "userIds" text[],
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Collections", hash: c1cfaa82f31142b7f3194bfde1f545db
CREATE TABLE "Collections" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "title" text NOT NULL,
    "slug" text NOT NULL,
    "gridImageId" text,
    "firstPageLink" text,
    "hideStartReadingButton" bool,
    "contents" jsonb,
    "contents_latest" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "CommentModeratorActions", hash: 811ec32b76e86c6016f2681a6d667e39
CREATE TABLE "CommentModeratorActions" (
    _id varchar(27) PRIMARY KEY,
    "commentId" varchar(27),
    "type" text,
    "endedAt" timestamptz,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Comments", hash: e52f960a223d52218b73705dce73f6ca
CREATE TABLE "Comments" (
    _id varchar(27) PRIMARY KEY,
    "parentCommentId" varchar(27),
    "topLevelCommentId" varchar(27),
    "postedAt" timestamptz,
    "author" text,
    "postId" varchar(27),
    "tagId" varchar(27),
    "tagCommentType" text DEFAULT 'DISCUSSION',
    "subforumStickyPriority" real,
    "userId" varchar(27),
    "userIP" text,
    "userAgent" text,
    "referrer" text,
    "authorIsUnreviewed" bool DEFAULT false,
    "answer" bool DEFAULT false,
    "parentAnswerId" varchar(27),
    "directChildrenCount" real DEFAULT 0,
    "descendentCount" real DEFAULT 0,
    "shortform" bool,
    "nominatedForReview" text,
    "reviewingForReview" text,
    "lastSubthreadActivity" timestamptz,
    "postVersion" text,
    "promoted" bool,
    "promotedByUserId" varchar(27),
    "promotedAt" timestamptz,
    "hideKarma" bool,
    "legacy" bool DEFAULT false,
    "legacyId" text,
    "legacyPoll" bool DEFAULT false,
    "legacyParentId" text,
    "retracted" bool DEFAULT false,
    "deleted" bool DEFAULT false,
    "deletedPublic" bool DEFAULT false,
    "deletedReason" text,
    "deletedDate" timestamptz,
    "deletedByUserId" varchar(27),
    "spam" bool DEFAULT false,
    "repliesBlockedUntil" timestamptz,
    "needsReview" bool,
    "reviewedByUserId" varchar(27),
    "hideAuthor" bool DEFAULT false,
    "moderatorHat" bool DEFAULT false,
    "hideModeratorHat" bool,
    "isPinnedOnProfile" bool DEFAULT false,
    "af" bool DEFAULT false,
    "suggestForAlignmentUserIds" text[],
    "reviewForAlignmentUserId" text,
    "afDate" timestamptz,
    "moveToAlignmentUserId" varchar(27),
    "agentFoundationsId" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "contents" jsonb,
    "contents_latest" text,
    "voteCount" real DEFAULT 0,
    "baseScore" real DEFAULT 0,
    "extendedScore" jsonb,
    "score" real DEFAULT 0,
    "inactive" bool,
    "afBaseScore" real,
    "afExtendedScore" jsonb,
    "afVoteCount" real
);

-- Schema for "Conversations", hash: a75b9b328d378ac3fcf608cc7b4b52aa
CREATE TABLE "Conversations" (
    _id varchar(27) PRIMARY KEY,
    "title" text,
    "participantIds" varchar(27)[],
    "latestActivity" timestamptz,
    "af" bool,
    "messageCount" real DEFAULT 0,
    "moderator" bool,
    "archivedByIds" varchar(27)[],
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "DatabaseMetadata", hash: c750219a5d0f3fc276db91d9902d6897
CREATE TABLE "DatabaseMetadata" (
    _id varchar(27) PRIMARY KEY,
    "name" text,
    "value" jsonb,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "DebouncerEvents", hash: 25a7a4d3999d2adbefa4bb42345d0e6c
CREATE TABLE "DebouncerEvents" (
    _id varchar(27) PRIMARY KEY,
    "name" text,
    "af" bool,
    "dispatched" bool,
    "failed" bool,
    "delayTime" timestamptz,
    "upperBoundTime" timestamptz,
    "key" text,
    "pendingEvents" jsonb[],
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "EmailTokens", hash: 470430c08680314d60397eb5934e15c8
CREATE TABLE "EmailTokens" (
    _id varchar(27) PRIMARY KEY,
    "token" text,
    "tokenType" text,
    "userId" varchar(27),
    "usedAt" timestamptz,
    "params" jsonb,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "FeaturedResources", hash: d0b7d6cc395df7df55cfb2522d302562
CREATE TABLE "FeaturedResources" (
    _id varchar(27) PRIMARY KEY,
    "title" text,
    "body" text,
    "ctaText" text,
    "ctaUrl" text,
    "expiresAt" timestamptz,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "GardenCodes", hash: a56672994e8e07bb3825195fc3b2ae35
CREATE TABLE "GardenCodes" (
    _id varchar(27) PRIMARY KEY,
    "code" text,
    "title" text DEFAULT 'Guest Day Pass',
    "userId" varchar(27),
    "slug" text,
    "startTime" timestamptz,
    "endTime" timestamptz,
    "fbLink" text,
    "type" text DEFAULT 'public',
    "hidden" bool DEFAULT false,
    "deleted" bool DEFAULT false,
    "afOnly" bool DEFAULT false,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "contents" jsonb,
    "contents_latest" text,
    "pingbacks" jsonb
);

-- Schema for "LWEvents", hash: ea56a776b750c3138238a661eda21889
CREATE TABLE "LWEvents" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "name" text,
    "documentId" text,
    "important" bool,
    "properties" jsonb,
    "intercom" bool,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "LegacyData", hash: e0375f7ddcd2cecb572616c46e7765fc
CREATE TABLE "LegacyData" (
    _id varchar(27) PRIMARY KEY,
    "objectId" text,
    "collectionName" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Localgroups", hash: 005f75bdc68f0cc175315a41bc00e22d
CREATE TABLE "Localgroups" (
    _id varchar(27) PRIMARY KEY,
    "name" text,
    "organizerIds" varchar(27)[],
    "lastActivity" timestamptz,
    "types" text[] DEFAULT '{''LW''}' ::text[],
    "categories" text[],
    "isOnline" bool DEFAULT false,
    "mongoLocation" jsonb,
    "googleLocation" jsonb,
    "location" text,
    "contactInfo" text,
    "facebookLink" text,
    "facebookPageLink" text,
    "meetupLink" text,
    "slackLink" text,
    "website" text,
    "bannerImageId" text,
    "inactive" bool DEFAULT false,
    "deleted" bool DEFAULT false,
    "contents" jsonb,
    "contents_latest" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Messages", hash: 9c78d6fb634676b616d213df2c2b9a57
CREATE TABLE "Messages" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "conversationId" varchar(27),
    "noEmail" bool DEFAULT false,
    "contents" jsonb,
    "contents_latest" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Migrations", hash: 4c9c03892a8544bda60daef2bfc68a16
CREATE TABLE "Migrations" (
    _id varchar(27) PRIMARY KEY,
    "name" text,
    "started" timestamptz,
    "finished" timestamptz,
    "succeeded" bool,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "ModerationTemplates", hash: 866080631ed8106869051630cd22d4a9
CREATE TABLE "ModerationTemplates" (
    _id varchar(27) PRIMARY KEY,
    "name" text,
    "collectionName" text,
    "order" real DEFAULT 0,
    "deleted" bool DEFAULT false,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "contents" jsonb,
    "contents_latest" text
);

-- Schema for "ModeratorActions", hash: b5b375064e84352da52623091ce8bdc8
CREATE TABLE "ModeratorActions" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "type" text,
    "endedAt" timestamptz,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Notifications", hash: 111b5a3f7797bfd69f05a1fde7f9dd77
CREATE TABLE "Notifications" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "documentId" text,
    "documentType" text,
    "extraData" jsonb,
    "link" text,
    "title" text,
    "message" text,
    "type" text,
    "deleted" bool DEFAULT false,
    "viewed" bool DEFAULT false,
    "emailed" bool DEFAULT false,
    "waitingForBatch" bool DEFAULT false,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "PetrovDayLaunchs", hash: 22ff77a173946e31ca09fa8c9c84c74b
CREATE TABLE "PetrovDayLaunchs" (
    _id varchar(27) PRIMARY KEY,
    "launchCode" text,
    "hashedLaunchCode" text,
    "userId" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "PodcastEpisodes", hash: a2598a7b97322ddb82f18b0cb52fa02a
CREATE TABLE "PodcastEpisodes" (
    _id varchar(27) PRIMARY KEY,
    "podcastId" varchar(27),
    "title" text NOT NULL,
    "episodeLink" text NOT NULL,
    "externalEpisodeId" text NOT NULL,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Podcasts", hash: 0ac1e8713c5ba0e186a39dc61ca868ce
CREATE TABLE "Podcasts" (
    _id varchar(27) PRIMARY KEY,
    "title" text NOT NULL,
    "applePodcastLink" text,
    "spotifyPodcastLink" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "PostRelations", hash: 0395cb6afa78c38177f3b906b619d68d
CREATE TABLE "PostRelations" (
    _id varchar(27) PRIMARY KEY,
    "type" text,
    "sourcePostId" varchar(27),
    "targetPostId" varchar(27),
    "order" real,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Posts", hash: e39dfb7efb92bccdc12c97e7ded91744
CREATE TABLE "Posts" (
    _id varchar(27) PRIMARY KEY,
    "postedAt" timestamptz,
    "modifiedAt" timestamptz,
    "url" varchar(500),
    "title" varchar(500) NOT NULL,
    "slug" text,
    "viewCount" real DEFAULT 0,
    "lastCommentedAt" timestamptz,
    "clickCount" real DEFAULT 0,
    "deletedDraft" bool DEFAULT false,
    "status" real,
    "isFuture" bool,
    "sticky" bool DEFAULT false,
    "stickyPriority" integer DEFAULT 2,
    "userIP" text,
    "userAgent" text,
    "referrer" text,
    "author" text,
    "userId" varchar(27),
    "question" bool DEFAULT false,
    "authorIsUnreviewed" bool DEFAULT false,
    "readTimeMinutesOverride" real,
    "submitToFrontpage" bool DEFAULT true,
    "hiddenRelatedQuestion" bool DEFAULT false,
    "originalPostRelationSourceId" text,
    "shortform" bool DEFAULT false,
    "canonicalSource" text,
    "nominationCount2018" real DEFAULT 0,
    "nominationCount2019" real DEFAULT 0,
    "reviewCount2018" real DEFAULT 0,
    "reviewCount2019" real DEFAULT 0,
    "reviewCount" real DEFAULT 0,
    "reviewVoteCount" real DEFAULT 0,
    "positiveReviewVoteCount" real DEFAULT 0,
    "reviewVoteScoreAF" real DEFAULT 0,
    "reviewVotesAF" real[] DEFAULT '{}' ::real[],
    "reviewVoteScoreHighKarma" real DEFAULT 0,
    "reviewVotesHighKarma" real[] DEFAULT '{}' ::real[],
    "reviewVoteScoreAllKarma" real DEFAULT 0,
    "reviewVotesAllKarma" real[] DEFAULT '{}' ::real[],
    "finalReviewVoteScoreHighKarma" real DEFAULT 0,
    "finalReviewVotesHighKarma" real[] DEFAULT '{}' ::real[],
    "finalReviewVoteScoreAllKarma" real DEFAULT 0,
    "finalReviewVotesAllKarma" real[] DEFAULT '{}' ::real[],
    "finalReviewVoteScoreAF" real DEFAULT 0,
    "finalReviewVotesAF" real[] DEFAULT '{}' ::real[],
    "lastCommentPromotedAt" timestamptz,
    "tagRelevance" jsonb,
    "noIndex" bool DEFAULT false,
    "rsvps" jsonb[],
    "activateRSVPs" bool,
    "nextDayReminderSent" bool DEFAULT false,
    "onlyVisibleToLoggedIn" bool DEFAULT false,
    "onlyVisibleToEstablishedAccounts" bool DEFAULT false,
    "hideFromRecentDiscussions" bool DEFAULT false,
    "votingSystem" text DEFAULT 'twoAxis',
    "podcastEpisodeId" varchar(27),
    "legacy" bool DEFAULT false,
    "legacyId" text,
    "legacySpam" bool DEFAULT false,
    "feedId" varchar(27),
    "feedLink" text,
    "curatedDate" timestamptz,
    "metaDate" timestamptz,
    "suggestForCuratedUserIds" varchar(27)[],
    "frontpageDate" timestamptz,
    "collectionTitle" text,
    "coauthorStatuses" jsonb[],
    "hasCoauthorPermission" bool DEFAULT true,
    "socialPreviewImageId" text,
    "socialPreviewImageAutoUrl" text,
    "fmCrosspost" jsonb DEFAULT '{"isCrosspost":false}' ::jsonb,
    "canonicalSequenceId" varchar(27),
    "canonicalCollectionSlug" text,
    "canonicalBookId" varchar(27),
    "canonicalNextPostSlug" text,
    "canonicalPrevPostSlug" text,
    "unlisted" bool DEFAULT false,
    "disableRecommendation" bool DEFAULT false,
    "defaultRecommendation" bool DEFAULT false,
    "draft" bool DEFAULT false,
    "meta" bool DEFAULT false,
    "hideFrontpageComments" bool DEFAULT false,
    "maxBaseScore" real,
    "scoreExceeded2Date" timestamptz,
    "scoreExceeded30Date" timestamptz,
    "scoreExceeded45Date" timestamptz,
    "scoreExceeded75Date" timestamptz,
    "scoreExceeded125Date" timestamptz,
    "scoreExceeded200Date" timestamptz,
    "bannedUserIds" varchar(27)[],
    "commentsLocked" bool,
    "commentsLockedToAccountsCreatedAfter" timestamptz,
    "organizerIds" varchar(27)[],
    "groupId" varchar(27),
    "eventType" text,
    "isEvent" bool DEFAULT false,
    "reviewedByUserId" varchar(27),
    "reviewForCuratedUserId" varchar(27),
    "startTime" timestamptz,
    "localStartTime" timestamptz,
    "endTime" timestamptz,
    "localEndTime" timestamptz,
    "eventRegistrationLink" text,
    "joinEventLink" text,
    "onlineEvent" bool DEFAULT false,
    "globalEvent" bool DEFAULT false,
    "mongoLocation" jsonb,
    "googleLocation" jsonb,
    "location" text,
    "contactInfo" text,
    "facebookLink" text,
    "meetupLink" text,
    "website" text,
    "eventImageId" text,
    "types" text[],
    "metaSticky" bool DEFAULT false,
    "sharingSettings" jsonb,
    "shareWithUsers" varchar(27)[],
    "linkSharingKey" text,
    "linkSharingKeyUsedBy" varchar(27)[],
    "commentSortOrder" text,
    "hideAuthor" bool DEFAULT false,
    "sideCommentsCache" jsonb,
    "sideCommentVisibility" text,
    "moderationStyle" text,
    "hideCommentKarma" bool DEFAULT false,
    "commentCount" real DEFAULT 0,
    "subforumTagId" varchar(27),
    "af" bool DEFAULT false,
    "afDate" timestamptz,
    "afCommentCount" real DEFAULT 0,
    "afLastCommentedAt" timestamptz,
    "afSticky" bool DEFAULT false,
    "suggestForAlignmentUserIds" text[],
    "reviewForAlignmentUserId" text,
    "agentFoundationsId" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "contents" jsonb,
    "contents_latest" text,
    "pingbacks" jsonb,
    "moderationGuidelines" jsonb,
    "moderationGuidelines_latest" text,
    "customHighlight" jsonb,
    "customHighlight_latest" text,
    "voteCount" real DEFAULT 0,
    "baseScore" real DEFAULT 0,
    "extendedScore" jsonb,
    "score" real DEFAULT 0,
    "inactive" bool,
    "afBaseScore" real,
    "afExtendedScore" jsonb,
    "afVoteCount" real
);

-- Schema for "RSSFeeds", hash: acc7f5103f91df1dae9a6e71c3339be7
CREATE TABLE "RSSFeeds" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "ownedByUser" bool DEFAULT false,
    "displayFullContent" bool DEFAULT false,
    "nickname" text,
    "url" text,
    "status" text,
    "rawFeed" jsonb,
    "setCanonicalUrl" bool DEFAULT false,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "ReadStatuses", hash: ded9d84075a1bd4253ee981e87b8966e
CREATE TABLE "ReadStatuses" (
    _id varchar(27) PRIMARY KEY,
    "postId" varchar(27),
    "tagId" varchar(27),
    "userId" varchar(27),
    "isRead" bool,
    "lastUpdated" timestamptz,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Reports", hash: be30bac8a4c7b885d68bac2a0c010708
CREATE TABLE "Reports" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "reportedUserId" varchar(27),
    "commentId" varchar(27),
    "postId" varchar(27),
    "link" text NOT NULL,
    "claimedUserId" varchar(27),
    "description" text,
    "closedAt" timestamptz,
    "markedAsSpam" bool,
    "reportedAsSpam" bool,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "ReviewVotes", hash: 5f0eba705af50eb13641a0fc030cc068
CREATE TABLE "ReviewVotes" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "postId" varchar(27),
    "qualitativeScore" integer DEFAULT 4,
    "quadraticScore" integer DEFAULT 0,
    "comment" text,
    "year" text DEFAULT '2018',
    "dummy" bool DEFAULT false,
    "reactions" text[],
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Revisions", hash: a245bc213bb89e9e03704a3ba22f9433
CREATE TABLE "Revisions" (
    _id varchar(27) PRIMARY KEY,
    "documentId" text,
    "collectionName" text,
    "fieldName" text,
    "editedAt" timestamptz,
    "autosaveTimeoutStart" timestamptz,
    "updateType" text,
    "version" text,
    "commitMessage" text,
    "userId" varchar(27),
    "draft" bool,
    "originalContents" jsonb,
    "html" text,
    "wordCount" real,
    "changeMetrics" jsonb,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "voteCount" real DEFAULT 0,
    "baseScore" real DEFAULT 0,
    "extendedScore" jsonb,
    "score" real DEFAULT 0,
    "inactive" bool,
    "afBaseScore" real,
    "afExtendedScore" jsonb,
    "afVoteCount" real
);

-- Schema for "Sequences", hash: 1fb785857fc041a9839ee351e6d677ea
CREATE TABLE "Sequences" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "title" text NOT NULL,
    "gridImageId" text,
    "bannerImageId" text,
    "curatedOrder" real,
    "userProfileOrder" real,
    "draft" bool DEFAULT false,
    "isDeleted" bool DEFAULT false,
    "canonicalCollectionSlug" text,
    "hidden" bool DEFAULT false,
    "hideFromAuthorPage" bool DEFAULT false,
    "af" bool DEFAULT false,
    "contents" jsonb,
    "contents_latest" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Spotlights", hash: 27dbb569aacba484fe1b2954a083ce89
CREATE TABLE "Spotlights" (
    _id varchar(27) PRIMARY KEY,
    "documentId" text,
    "documentType" text DEFAULT 'Sequence',
    "position" real,
    "duration" real DEFAULT 3,
    "customTitle" text,
    "customSubtitle" text,
    "lastPromotedAt" timestamptz DEFAULT '1970-01-01T00:00:00.000Z',
    "draft" bool DEFAULT true,
    "spotlightImageId" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "description_latest" text
);

-- Schema for "Subscriptions", hash: 7acb58825d3aede84fd7e4261379faac
CREATE TABLE "Subscriptions" (
    _id varchar(27) PRIMARY KEY,
    "userId" varchar(27),
    "state" text,
    "documentId" text,
    "collectionName" text,
    "deleted" bool DEFAULT false,
    "type" text,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "TagFlags", hash: 44d11832d3aa72bddd1ae04cbd9aac8d
CREATE TABLE "TagFlags" (
    _id varchar(27) PRIMARY KEY,
    "name" text,
    "deleted" bool DEFAULT false,
    "slug" text,
    "order" real,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "contents" jsonb,
    "contents_latest" text
);

-- Schema for "TagRels", hash: fac612eb73af12a28cfe9f14ffac3caa
CREATE TABLE "TagRels" (
    _id varchar(27) PRIMARY KEY,
    "tagId" varchar(27),
    "postId" varchar(27),
    "deleted" bool DEFAULT false,
    "userId" varchar(27),
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "voteCount" real DEFAULT 0,
    "baseScore" real DEFAULT 0,
    "extendedScore" jsonb,
    "score" real DEFAULT 0,
    "inactive" bool,
    "afBaseScore" real,
    "afExtendedScore" jsonb,
    "afVoteCount" real
);

-- Schema for "Tags", hash: ced04b473525228c57666345aec45f2e
CREATE TABLE "Tags" (
    _id varchar(27) PRIMARY KEY,
    "name" text,
    "slug" text,
    "oldSlugs" text[],
    "core" bool DEFAULT false,
    "suggestedAsFilter" bool DEFAULT false,
    "defaultOrder" real DEFAULT 0,
    "descriptionTruncationCount" real DEFAULT 0,
    "postCount" real DEFAULT 0,
    "userId" varchar(27),
    "adminOnly" bool DEFAULT false,
    "canEditUserIds" varchar(27)[],
    "charsAdded" real,
    "charsRemoved" real,
    "deleted" bool DEFAULT false,
    "lastCommentedAt" timestamptz,
    "lastSubforumCommentAt" timestamptz,
    "needsReview" bool DEFAULT true,
    "reviewedByUserId" varchar(27),
    "wikiGrade" integer DEFAULT 2,
    "wikiOnly" bool DEFAULT false,
    "bannerImageId" text,
    "tagFlagsIds" varchar(27)[],
    "lesswrongWikiImportRevision" text,
    "lesswrongWikiImportSlug" text,
    "lesswrongWikiImportCompleted" bool,
    "htmlWithContributorAnnotations" text,
    "contributionStats" jsonb,
    "introSequenceId" varchar(27),
    "postsDefaultSortOrder" text,
    "canVoteOnRels" text[],
    "isSubforum" bool DEFAULT false,
    "subforumModeratorIds" varchar(27)[],
    "parentTagId" varchar(27),
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "description_latest" text,
    "subforumWelcomeText_latest" text,
    "moderationGuidelines" jsonb,
    "moderationGuidelines_latest" text
);

-- Schema for "UserTagRels", hash: af606de912f15969687f3a111a56bec6
CREATE TABLE "UserTagRels" (
    _id varchar(27) PRIMARY KEY,
    "tagId" varchar(27),
    "userId" varchar(27),
    "subforumLastVisitedAt" timestamptz,
    "subforumShowUnreadInSidebar" bool NOT NULL DEFAULT true,
    "subforumEmailNotifications" bool NOT NULL DEFAULT true,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

-- Schema for "Users", hash: 6d87ad19cfba7863d9b8851185592703
CREATE TABLE "Users" (
    _id varchar(27) PRIMARY KEY,
    "username" text,
    "emails" jsonb[],
    "isAdmin" bool,
    "profile" jsonb,
    "services" jsonb,
    "displayName" text,
    "previousDisplayName" text,
    "email" text,
    "slug" text,
    "noindex" bool DEFAULT false,
    "groups" text[],
    "lwWikiImport" bool,
    "theme" jsonb DEFAULT '{"name":"auto"}' ::jsonb,
    "lastUsedTimezone" text,
    "whenConfirmationEmailSent" timestamptz,
    "legacy" bool DEFAULT false,
    "commentSorting" text,
    "sortDraftsBy" text,
    "noKibitz" bool,
    "showHideKarmaOption" bool,
    "showPostAuthorCard" bool,
    "hideIntercom" bool DEFAULT false,
    "markDownPostEditor" bool DEFAULT false,
    "hideElicitPredictions" bool DEFAULT false,
    "hideAFNonMemberInitialWarning" bool DEFAULT false,
    "noSingleLineComments" bool DEFAULT false,
    "noCollapseCommentsPosts" bool DEFAULT false,
    "noCollapseCommentsFrontpage" bool DEFAULT false,
    "petrovOptOut" bool DEFAULT false,
    "acceptedTos" bool DEFAULT false,
    "hideNavigationSidebar" bool,
    "currentFrontpageFilter" text,
    "frontpageFilterSettings" jsonb,
    "allPostsTimeframe" text,
    "allPostsFilter" text,
    "allPostsSorting" text,
    "allPostsShowLowKarma" bool,
    "allPostsIncludeEvents" bool,
    "allPostsOpenSettings" bool,
    "draftsListSorting" text,
    "draftsListShowArchived" bool,
    "draftsListShowShared" bool,
    "lastNotificationsCheck" timestamptz,
    "karma" real,
    "goodHeartTokens" real,
    "moderationStyle" text,
    "moderatorAssistance" bool,
    "collapseModerationGuidelines" bool,
    "bannedUserIds" varchar(27)[],
    "bannedPersonalUserIds" varchar(27)[],
    "bookmarkedPostsMetadata" jsonb[],
    "hiddenPostsMetadata" jsonb[],
    "legacyId" text,
    "deleted" bool DEFAULT false,
    "voteBanned" bool,
    "nullifyVotes" bool,
    "deleteContent" bool,
    "banned" timestamptz,
    "auto_subscribe_to_my_posts" bool DEFAULT true,
    "auto_subscribe_to_my_comments" bool DEFAULT true,
    "autoSubscribeAsOrganizer" bool DEFAULT true,
    "notificationCommentsOnSubscribedPost" jsonb DEFAULT '{"channel":"onsite","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationShortformContent" jsonb DEFAULT '{"channel":"onsite","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationRepliesToMyComments" jsonb DEFAULT '{"channel":"onsite","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationRepliesToSubscribedComments" jsonb DEFAULT '{"channel":"onsite","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationSubscribedUserPost" jsonb DEFAULT '{"channel":"onsite","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationPostsInGroups" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationSubscribedTagPost" jsonb DEFAULT '{"channel":"onsite","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationPrivateMessage" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationSharedWithMe" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationAlignmentSubmissionApproved" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationEventInRadius" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationRSVPs" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationGroupAdministration" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationCommentsOnDraft" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationPostsNominatedReview" jsonb DEFAULT '{"channel":"both","batchingFrequency":"realtime","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "notificationSubforumUnread" jsonb DEFAULT '{"channel":"email","batchingFrequency":"daily","timeOfDayGMT":12,"dayOfWeekGMT":"Monday"}' ::jsonb,
    "karmaChangeNotifierSettings" jsonb DEFAULT '{"updateFrequency":"daily","timeOfDayGMT":11,"dayOfWeekGMT":"Saturday","showNegativeKarma":false}' ::jsonb,
    "karmaChangeLastOpened" timestamptz,
    "karmaChangeBatchStart" timestamptz,
    "emailSubscribedToCurated" bool,
    "subscribedToDigest" bool DEFAULT false,
    "unsubscribeFromAll" bool,
    "hideSubscribePoke" bool DEFAULT false,
    "hideMeetupsPoke" bool DEFAULT false,
    "frontpagePostCount" real DEFAULT 0,
    "sequenceCount" real DEFAULT 0,
    "sequenceDraftCount" real DEFAULT 0,
    "mongoLocation" jsonb,
    "googleLocation" jsonb,
    "location" text,
    "mapLocation" jsonb,
    "mapLocationSet" bool,
    "mapMarkerText" text,
    "htmlMapMarkerText" text,
    "nearbyEventsNotifications" bool DEFAULT false,
    "nearbyEventsNotificationsLocation" jsonb,
    "nearbyEventsNotificationsMongoLocation" jsonb,
    "nearbyEventsNotificationsRadius" real,
    "nearbyPeopleNotificationThreshold" real,
    "hideFrontpageMap" bool,
    "hideTaggingProgressBar" bool,
    "hideFrontpageBookAd" bool,
    "hideFrontpageBook2019Ad" bool,
    "sunshineNotes" text DEFAULT '',
    "sunshineFlagged" bool DEFAULT false,
    "needsReview" bool DEFAULT false,
    "sunshineSnoozed" bool DEFAULT false,
    "snoozedUntilContentCount" real,
    "reviewedByUserId" varchar(27),
    "reviewedAt" timestamptz,
    "afKarma" real DEFAULT 0,
    "voteCount" real,
    "smallUpvoteCount" real,
    "smallDownvoteCount" real,
    "bigUpvoteCount" real,
    "bigDownvoteCount" real,
    "fullName" text,
    "shortformFeedId" varchar(27),
    "viewUnreviewedComments" bool,
    "partiallyReadSequences" jsonb[],
    "beta" bool,
    "reviewVotesQuadratic" bool,
    "reviewVotesQuadratic2019" bool,
    "reviewVotesQuadratic2020" bool,
    "petrovPressedButtonDate" timestamptz,
    "petrovLaunchCodeDate" timestamptz,
    "defaultToCKEditor" bool,
    "signUpReCaptchaRating" real,
    "oldSlugs" text[],
    "noExpandUnreadCommentsReview" bool DEFAULT false,
    "postCount" real DEFAULT 0,
    "maxPostCount" real DEFAULT 0,
    "commentCount" real DEFAULT 0,
    "maxCommentCount" real DEFAULT 0,
    "tagRevisionCount" real DEFAULT 0,
    "abTestKey" text,
    "abTestOverrides" jsonb,
    "reenableDraftJs" bool,
    "walledGardenInvite" bool,
    "hideWalledGardenUI" bool,
    "walledGardenPortalOnboarded" bool,
    "taggingDashboardCollapsed" bool,
    "usernameUnset" bool DEFAULT false,
    "paymentEmail" text,
    "paymentInfo" text,
    "profileImageId" text,
    "jobTitle" text,
    "organization" text,
    "careerStage" text[],
    "website" text,
    "fmCrosspostUserId" text,
    "linkedinProfileURL" text,
    "facebookProfileURL" text,
    "twitterProfileURL" text,
    "githubProfileURL" text,
    "profileTagIds" varchar(27)[],
    "organizerOfGroupIds" varchar(27)[],
    "programParticipation" text[],
    "postingDisabled" bool,
    "allCommentingDisabled" bool,
    "commentingOnOtherUsersDisabled" bool,
    "conversationsDisabled" bool,
    "acknowledgedNewUserGuidelines" bool,
    "experiencedIn" text[],
    "interestedIn" text[],
    "afPostCount" real DEFAULT 0,
    "afCommentCount" real DEFAULT 0,
    "afSequenceCount" real DEFAULT 0,
    "afSequenceDraftCount" real DEFAULT 0,
    "reviewForAlignmentForumUserId" text,
    "afApplicationText" text,
    "afSubmittedApplication" bool,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb,
    "moderationGuidelines" jsonb,
    "moderationGuidelines_latest" text,
    "howOthersCanHelpMe_latest" text,
    "howICanHelpOthers_latest" text,
    "biography_latest" text,
    "recommendationSettings" jsonb
);

-- Schema for "Votes", hash: 32cb95b43d23a39d071d4ec8f2f019b0
CREATE TABLE "Votes" (
    _id varchar(27) PRIMARY KEY,
    "documentId" text,
    "collectionName" text,
    "userId" varchar(27),
    "authorIds" varchar(27)[],
    "voteType" text,
    "extendedVoteType" jsonb,
    "power" real,
    "afPower" real,
    "cancelled" bool DEFAULT false,
    "isUnvote" bool DEFAULT false,
    "votedAt" timestamptz,
    "documentIsAf" bool DEFAULT false,
    "schemaVersion" real DEFAULT 1,
    "createdAt" timestamptz,
    "legacyData" jsonb
);

