# Authentication Token
public type AuthenticationToken record {
    # The token used for authentication
    string token;
    # The time this token expires
    string expires_at;
    record {} permissions?;
    # The repositories this token has access to
    Repository[] repositories?;
    string? single_file?;
    # Describe whether all repositories have been selected or there's a selection involved
    string repository_selection?;
};

# Project columns contain cards of work.
public type ProjectColumn record {
    string url;
    string project_url;
    string cards_url;
    # The unique identifier of the project column
    int id;
    string node_id;
    # Name of the project column
    string name;
    string created_at;
    string updated_at;
};

# Code Search Result Item
public type CodeSearchResultItem record {
    string name;
    string path;
    string sha;
    string url;
    string git_url;
    string html_url;
    # Minimal Repository
    MinimalRepository repository;
    decimal score;
    int file_size?;
    string? language?;
    string last_modified_at?;
    string[] line_numbers?;
    SearchResultTextMatches text_matches?;
};

# Issue Event
public type IssueEvent record {
    int id;
    string node_id;
    string url;
    simple-user actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # Issue Simple
    IssueSimple issue?;
    # Issue Event Label
    IssueEventLabel label?;
    simple-user assignee?;
    simple-user assigner?;
    simple-user review_requester?;
    simple-user requested_reviewer?;
    # Groups of organization members that gives permissions on specified repositories.
    Team requested_team?;
    IssueEventDismissedReview dismissed_review?;
    # Issue Event Milestone
    IssueEventMilestone milestone?;
    # Issue Event Project Card
    IssueEventProjectCard project_card?;
    # Issue Event Rename
    IssueEventRename rename?;
    # How the author is associated with the repository.
    AuthorAssociation author_association?;
    string? lock_reason?;
    integration performed_via_github_app?;
};

public type CodeScanningSarifsStatus record {
    # `pending` files have not yet been processed, while `complete` means all results in the SARIF have been stored.
    string processing_status?;
    # The REST API URL for getting the analyses associated with the upload.
    string? analyses_url?;
};

# Timeline Comment Event
public type TimelineCommentEvent record {
    string event;
    # Simple User
    SimpleUser? actor;
    # Unique identifier of the issue comment
    int id;
    string node_id;
    # URL for the issue comment
    string url;
    # Contents of the issue comment
    string body?;
    string body_text?;
    string body_html?;
    string html_url;
    # Simple User
    SimpleUser? user;
    string created_at;
    string updated_at;
    string issue_url;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app?;
    ReactionRollup reactions?;
};

# Timeline Line Commented Event
public type TimelineLineCommentedEvent record {
    string event?;
    string node_id?;
    PullRequestReviewComment[] comments?;
};

# A Base64 string representing the SARIF file to upload. You must first compress your SARIF file using [`gzip`](http://www.gnu.org/software/gzip/manual/gzip.html) and then translate the contents of the file into a Base64 encoding string. For more information, see "[SARIF support for code scanning](https://docs.github.com/code-security/secure-coding/sarif-support-for-code-scanning)."
#
public type CodeScanningAnalysisSarifFile string;

# Removed from Project Issue Event
public type RemovedFromProjectIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { int id; string url; int project_id; string project_url; string column_name; string previous_column_name?;}  project_card?;
};

# Actor
public type Actor record {
    int id;
    string login;
    string display_login?;
    string? gravatar_id;
    string url;
    string avatar_url;
};

# Validation Error
public type ValidationError record {
    string message;
    string documentation_url;
    record  { string 'resource?; string 'field?; string message?; string code; int index?; string|int|[] value?;} [] errors?;
};

public type SecretScanningAlert record {
    # The security alert number.
    AlertNumber number?;
    # The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    AlertCreatedAt created_at?;
    # The REST API URL of the alert resource.
    AlertUrl url?;
    # The GitHub URL of the alert resource.
    AlertHtmlUrl html_url?;
    # Sets the state of the secret scanning alert. Can be either `open` or `resolved`. You must provide `resolution` when you set the state to `resolved`.
    SecretScanningAlertState state?;
    # **Required when the `state` is `resolved`.** The reason for resolving the alert. Can be one of `false_positive`, `wont_fix`, `revoked`, or `used_in_tests`.
    SecretScanningAlertResolution? resolution?;
    # The time that the alert was resolved in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? resolved_at?;
    # Simple User
    SimpleUser? resolved_by?;
    # The type of secret that secret scanning detected.
    string secret_type?;
    # The secret that was detected.
    string secret?;
};

# Set secrets for GitHub Actions.
public type ActionsSecret record {
    # The name of the secret.
    string name;
    string created_at;
    string updated_at;
};

# The GitHub URL of the alert resource.
#
public type AlertHtmlUrl string;

# Diff Entry
public type DiffEntry record {
    string sha;
    string filename;
    string status;
    int additions;
    int deletions;
    int changes;
    string blob_url;
    string raw_url;
    string contents_url;
    string patch?;
    string previous_filename?;
};

# Workflow Usage
public type WorkflowUsage record {
    record  { record  { int total_ms?;}  UBUNTU?; record  { int total_ms?;}  MACOS?; record  { int total_ms?;}  WINDOWS?;}  billable;
};

# The status of a commit.
public type Status record {
    string url;
    string? avatar_url;
    int id;
    string node_id;
    string state;
    string description;
    string target_url;
    string context;
    string created_at;
    string updated_at;
    # Simple User
    SimpleUser? creator;
};

# Api Overview
public type ApiOverview record {
    boolean verifiable_password_authentication;
    record  { string SHA256_RSA?; string SHA256_DSA?;}  ssh_key_fingerprints?;
    string[] hooks?;
    string[] web?;
    string[] api?;
    string[] git?;
    string[] packages?;
    string[] pages?;
    string[] importer?;
    string[] actions?;
    string[] dependabot?;
};

# Review Requested Issue Event
public type ReviewRequestedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    # Simple User
    SimpleUser? review_requester;
    # Groups of organization members that gives permissions on specified repositories.
    Team requested_team?;
    # Simple User
    SimpleUser? requested_reviewer?;
};

# The policy that controls the organizations in the enterprise that are allowed to run GitHub Actions. Can be one of: `all`, `none`, or `selected`.
#
public type EnabledOrganizations string;

# **Required when the `state` is `resolved`.** The reason for resolving the alert. Can be one of `false_positive`, `wont_fix`, `revoked`, or `used_in_tests`.
#
public type SecretScanningAlertResolution string;

# A GitHub Actions workflow
public type Workflow record {
    int id;
    string node_id;
    string name;
    string path;
    string state;
    string created_at;
    string updated_at;
    string url;
    string html_url;
    string badge_url;
    string deleted_at?;
};

# Timeline Cross Referenced Event
public type TimelineCrossReferencedEvent record {
    string event;
    # Simple User
    SimpleUser? actor?;
    string created_at;
    string updated_at;
    record  { string 'type?; # Issue Simple
        IssueSimple issue?;}  'source;
};

# Commit Search Result Item
public type CommitSearchResultItem record {
    string url;
    string sha;
    string html_url;
    string comments_url;
    record  { record  { string name; string email; string date;}  author; git-user committer; int comment_count; string message; record  { string sha; string url;}  tree; string url; Verification verification?;}  'commit;
    simple-user author;
    git-user committer;
    record  { string url?; string html_url?; string sha?;} [] parents;
    # Minimal Repository
    MinimalRepository repository;
    decimal score;
    string node_id;
    SearchResultTextMatches text_matches?;
};

# The SHA of the commit to which the analysis you are uploading relates.
#
public type CodeScanningAnalysisCommitSha string;

# Projects are a way to organize columns and cards of work.
public type Project record {
    string owner_url;
    string url;
    string html_url;
    string columns_url;
    int id;
    string node_id;
    # Name of the project
    string name;
    # Body of the project
    string? body;
    int number;
    # State of the project; either 'open' or 'closed'
    string state;
    simple-user creator;
    string created_at;
    string updated_at;
    # The baseline permission that all organization members have on this project. Only present if owner is an organization.
    string organization_permission?;
    # Whether or not this project can be seen by everyone. Only present if owner is an organization.
    boolean 'private?;
};

# Organization Full
public type OrganizationFull record {
    string login;
    int id;
    string node_id;
    string url;
    string repos_url;
    string events_url;
    string hooks_url;
    string issues_url;
    string members_url;
    string public_members_url;
    string avatar_url;
    string? description;
    string name?;
    string company?;
    string blog?;
    string location?;
    string email?;
    string? twitter_username?;
    boolean is_verified?;
    boolean has_organization_projects;
    boolean has_repository_projects;
    int public_repos;
    int public_gists;
    int followers;
    int following;
    string html_url;
    string created_at;
    string 'type;
    int total_private_repos?;
    int owned_private_repos?;
    int? private_gists?;
    int? disk_usage?;
    int? collaborators?;
    string? billing_email?;
    record  { string name; int space; int private_repos; int filled_seats?; int seats?;}  plan?;
    string? default_repository_permission?;
    boolean? members_can_create_repositories?;
    boolean? two_factor_requirement_enabled?;
    string members_allowed_repository_creation_type?;
    boolean members_can_create_public_repositories?;
    boolean members_can_create_private_repositories?;
    boolean members_can_create_internal_repositories?;
    boolean members_can_create_pages?;
    boolean members_can_create_public_pages?;
    boolean members_can_create_private_pages?;
    string updated_at;
};

# Topic Search Result Item
public type TopicSearchResultItem record {
    string name;
    string? display_name;
    string? short_description;
    string? description;
    string? created_by;
    string? released;
    string created_at;
    string updated_at;
    boolean featured;
    boolean curated;
    decimal score;
    int? repository_count?;
    string? logo_url?;
    SearchResultTextMatches text_matches?;
    record  { record  { int id?; string name?; int topic_id?; string relation_type?;}  topic_relation?;} [] related?;
    record  { record  { int id?; string name?; int topic_id?; string relation_type?;}  topic_relation?;} [] aliases?;
};

public type PagesSourceHash record {
    string branch;
    string path;
};

# Hypermedia Link
public type Link record {
    string href;
};

# Key
public type Key record {
    string 'key;
    int id;
    string url;
    string title;
    string created_at;
    boolean verified;
    boolean read_only;
};

# View Traffic
public type ViewTraffic record {
    int count;
    int uniques;
    Traffic[] views;
};

public type CodeScanningAlertRuleSummary record {
    # A unique identifier for the rule used to detect the alert.
    string? id?;
    # The name of the rule used to detect the alert.
    string name?;
    # The severity of the alert.
    string? severity?;
    # A short description of the rule used to detect the alert.
    string description?;
};

# Commit Comparison
public type CommitComparison record {
    string url;
    string html_url;
    string permalink_url;
    string diff_url;
    string patch_url;
    # Commit
    Commit base_commit;
    # Commit
    Commit merge_base_commit;
    string status;
    int ahead_by;
    int behind_by;
    int total_commits;
    Commit[] commits;
    DiffEntry[] files?;
};

# The type of reviewer. Must be one of: `User` or `Team`
#
public type DeploymentReviewerType string;

# Labeled Issue Event
public type LabeledIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { string name; string color;}  label;
};

# The type of deployment branch policy for this environment. To allow all branches to deploy, set to `null`.
public type DeploymentBranchPolicy record {
    # Whether only branches with branch protection rules can deploy to this environment. If `protected_branches` is `true`, `custom_branch_policies` must be `false`; if `protected_branches` is `false`, `custom_branch_policies` must be `true`.
    boolean protected_branches;
    # Whether only branches that match the specified name patterns can deploy to this environment.  If `custom_branch_policies` is `true`, `protected_branches` must be `false`; if `custom_branch_policies` is `false`, `protected_branches` must be `true`.
    boolean custom_branch_policies;
};

# A team's access to a project.
public type TeamProject record {
    string owner_url;
    string url;
    string html_url;
    string columns_url;
    int id;
    string node_id;
    string name;
    string? body;
    int number;
    string state;
    # Simple User
    SimpleUser? creator;
    string created_at;
    string updated_at;
    # The organization permission for this project. Only present when owner is an organization.
    string organization_permission?;
    # Whether the project is private or not. Only present when owner is an organization.
    boolean 'private?;
    record  { boolean read; boolean write; boolean admin;}  permissions;
};

# Branch Short
public type BranchShort record {
    string name;
    record  { string sha; string url;}  'commit;
    boolean protected;
};

public type Traffic record {
    string timestamp;
    int uniques;
    int count;
};

public type ActionsBillingUsage record {
    # The sum of the free and paid GitHub Actions minutes used.
    int total_minutes_used;
    # The total paid GitHub Actions minutes used.
    int total_paid_minutes_used;
    # The amount of free GitHub Actions minutes available.
    int included_minutes;
    record  { # Total minutes used on Ubuntu runner machines.
        int UBUNTU?; # Total minutes used on macOS runner machines.
        int MACOS?; # Total minutes used on Windows runner machines.
        int WINDOWS?;}  minutes_used_breakdown;
};

# Short Branch
public type ShortBranch record {
    string name;
    record  { string sha; string url;}  'commit;
    boolean protected;
    # Branch Protection
    BranchProtection protection?;
    string protection_url?;
};

# Marketplace Listing Plan
public type MarketplaceListingPlan record {
    string url;
    string accounts_url;
    int id;
    int number;
    string name;
    string description;
    int monthly_price_in_cents;
    int yearly_price_in_cents;
    string price_model;
    boolean has_free_trial;
    string? unit_name;
    string state;
    string[] bullets;
};

# The time that the alert was dismissed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
#
public type CodeScanningAlertDismissedAt string;

# A version of a software package
public type PackageVersion record {
    # Unique identifier of the package version.
    int id;
    # The name of the package version.
    string name;
    string url;
    string package_html_url;
    string html_url?;
    string license?;
    string description?;
    string created_at;
    string updated_at;
    string deleted_at?;
    record  { string package_type; record  { string[] tags;}  container?; record  { string[] tag?;}  docker?;}  metadata?;
};

# Issue Event for Issue
#
public type  IssueEventForIssue labeled-issue-event|unlabeled-issue-event|assigned-issue-event|unassigned-issue-event|milestoned-issue-event|demilestoned-issue-event|renamed-issue-event|review-requested-issue-event|review-request-removed-issue-event|review-dismissed-issue-event|locked-issue-event|added-to-project-issue-event|moved-column-in-project-issue-event|removed-from-project-issue-event|converted-note-to-issue-issue-event;

# Repo Search Result Item
public type RepoSearchResultItem record {
    int id;
    string node_id;
    string name;
    string full_name;
    simple-user owner;
    boolean 'private;
    string html_url;
    string? description;
    boolean 'fork;
    string url;
    string created_at;
    string updated_at;
    string pushed_at;
    string? homepage;
    int size;
    int stargazers_count;
    int watchers_count;
    string? language;
    int forks_count;
    int open_issues_count;
    string master_branch?;
    string default_branch;
    decimal score;
    string forks_url;
    string keys_url;
    string collaborators_url;
    string teams_url;
    string hooks_url;
    string issue_events_url;
    string events_url;
    string assignees_url;
    string branches_url;
    string tags_url;
    string blobs_url;
    string git_tags_url;
    string git_refs_url;
    string trees_url;
    string statuses_url;
    string languages_url;
    string stargazers_url;
    string contributors_url;
    string subscribers_url;
    string subscription_url;
    string commits_url;
    string git_commits_url;
    string comments_url;
    string issue_comment_url;
    string contents_url;
    string compare_url;
    string merges_url;
    string archive_url;
    string downloads_url;
    string issues_url;
    string pulls_url;
    string milestones_url;
    string notifications_url;
    string labels_url;
    string releases_url;
    string deployments_url;
    string git_url;
    string ssh_url;
    string clone_url;
    string svn_url;
    int forks;
    int open_issues;
    int watchers;
    string[] topics?;
    string? mirror_url;
    boolean has_issues;
    boolean has_projects;
    boolean has_pages;
    boolean has_wiki;
    boolean has_downloads;
    boolean archived;
    # Returns whether or not this repository disabled.
    boolean disabled;
    license-simple license;
    record  { boolean admin; boolean pull; boolean push;}  permissions?;
    SearchResultTextMatches text_matches?;
    string temp_clone_token?;
    boolean allow_merge_commit?;
    boolean allow_squash_merge?;
    boolean allow_rebase_merge?;
    boolean delete_branch_on_merge?;
};

public type ActionsOrganizationPermissions record {
    # The policy that controls the repositories in the organization that are allowed to run GitHub Actions. Can be one of: `all`, `none`, or `selected`.
    EnabledRepositories enabled_repositories;
    # The API URL to use to get or set the selected repositories that are allowed to run GitHub Actions, when `enabled_repositories` is set to `selected`.
    string selected_repositories_url?;
    # The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
    AllowedActions allowed_actions?;
    # The API URL to use to get or set the actions that are allowed to run, when `allowed_actions` is set to `selected`.
    SelectedActionsUrl selected_actions_url?;
};

public type RunnerGroupsOrg record {
    decimal id;
    string name;
    string visibility;
    boolean 'default;
    # Link to the selected repositories resource for this runner group. Not present unless visibility was set to `selected`
    string selected_repositories_url?;
    string runners_url;
    boolean inherited;
    boolean inherited_allows_public_repositories?;
    boolean allows_public_repositories;
};

# Configuration object of the webhook
public type WebhookConfig record {
    # The URL to which the payloads will be delivered.
    WebhookConfigUrl url?;
    # The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
    WebhookConfigContentType content_type?;
    # If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
    WebhookConfigSecret secret?;
    WebhookConfigInsecureSsl insecure_ssl?;
};

# Full Repository
public type FullRepository record {
    int id;
    string node_id;
    string name;
    string full_name;
    # Simple User
    SimpleUser? owner;
    boolean 'private;
    string html_url;
    string? description;
    boolean 'fork;
    string url;
    string archive_url;
    string assignees_url;
    string blobs_url;
    string branches_url;
    string collaborators_url;
    string comments_url;
    string commits_url;
    string compare_url;
    string contents_url;
    string contributors_url;
    string deployments_url;
    string downloads_url;
    string events_url;
    string forks_url;
    string git_commits_url;
    string git_refs_url;
    string git_tags_url;
    string git_url;
    string issue_comment_url;
    string issue_events_url;
    string issues_url;
    string keys_url;
    string labels_url;
    string languages_url;
    string merges_url;
    string milestones_url;
    string notifications_url;
    string pulls_url;
    string releases_url;
    string ssh_url;
    string stargazers_url;
    string statuses_url;
    string subscribers_url;
    string subscription_url;
    string tags_url;
    string teams_url;
    string trees_url;
    string clone_url;
    string? mirror_url;
    string hooks_url;
    string svn_url;
    string? homepage;
    string? language;
    int forks_count;
    int stargazers_count;
    int watchers_count;
    int size;
    string default_branch;
    int open_issues_count;
    boolean is_template?;
    string[] topics?;
    boolean has_issues;
    boolean has_projects;
    boolean has_wiki;
    boolean has_pages;
    boolean has_downloads;
    boolean archived;
    # Returns whether or not this repository disabled.
    boolean disabled;
    # The repository visibility: public, private, or internal.
    string visibility?;
    string pushed_at;
    string created_at;
    string updated_at;
    record  { boolean admin; boolean pull; boolean push;}  permissions?;
    boolean allow_rebase_merge?;
    record {} template_repository?;
    string? temp_clone_token?;
    boolean allow_squash_merge?;
    boolean delete_branch_on_merge?;
    boolean allow_merge_commit?;
    int subscribers_count;
    int network_count;
    license-simple license;
    simple-user organization?;
    # A git repository
    Repository parent?;
    # A git repository
    Repository 'source?;
    int forks;
    string master_branch?;
    int open_issues;
    int watchers;
    # Whether anonymous git access is allowed.
    boolean anonymous_access_enabled?;
    # Code of Conduct Simple
    CodeOfConductSimple code_of_conduct?;
    record  { record  { string status?;}  advanced_security?; record  { string status?;}  secret_scanning?;}  security_and_analysis?;
};

# Repository Collaborator Permission
public type RepositoryCollaboratorPermission record {
    string permission;
    simple-user user;
};

# Groups of organization members that gives permissions on specified repositories.
public type Team record {
    int id;
    string node_id;
    string name;
    string slug;
    string? description;
    string privacy?;
    string permission;
    record  { boolean pull; boolean triage; boolean push; boolean maintain; boolean admin;}  permissions?;
    string url;
    string html_url;
    string members_url;
    string repositories_url;
    team-simple parent;
};

# The duration of the interaction restriction. Can be one of: `one_day`, `three_days`, `one_week`, `one_month`, `six_months`. Default: `one_day`.
#
public type InteractionExpiry string;

# Scim Error
public type ScimError record {
    string? message?;
    string? documentation_url?;
    string? detail?;
    int status?;
    string? scimType?;
    string[] schemas?;
};

public type SelectedActions record {
    # Whether GitHub-owned actions are allowed. For example, this includes the actions in the `actions` organization.
    boolean github_owned_allowed?;
    # Whether actions in GitHub Marketplace from verified creators are allowed. Set to `true` to allow all GitHub Marketplace actions by verified creators.
    boolean verified_allowed?;
    # Specifies a list of string-matching patterns to allow specific action(s). Wildcards, tags, and SHAs are allowed. For example, `monalisa/octocat@*`, `monalisa/octocat@v2`, `monalisa/*`."
    string[] patterns_allowed?;
};

# Rate Limit Overview
public type RateLimitOverview record {
    record  { RateLimit core; RateLimit graphql?; RateLimit search; RateLimit source_import?; RateLimit integration_manifest?; RateLimit code_scanning_upload?;}  resources;
    RateLimit rate;
};

# Porter Author
public type PorterAuthor record {
    int id;
    string remote_id;
    string remote_name;
    string email;
    string name;
    string url;
    string import_url;
};

# Sets the state of the secret scanning alert. Can be either `open` or `resolved`. You must provide `resolution` when you set the state to `resolved`.
#
public type SecretScanningAlertState string;

# Base Gist
public type BaseGist record {
    string url;
    string forks_url;
    string commits_url;
    string id;
    string node_id;
    string git_pull_url;
    string git_push_url;
    string html_url;
    record {} files;
    boolean 'public;
    string created_at;
    string updated_at;
    string? description;
    int comments;
    simple-user user;
    string comments_url;
    simple-user owner?;
    boolean truncated?;
    anydata[] forks?;
    anydata[] history?;
};

# Reactions to conversations provide a way to help people express their feelings more simply and effectively.
public type Reaction record {
    int id;
    string node_id;
    simple-user user;
    # The reaction to use
    string content;
    string created_at;
};

# Issue Search Result Item
public type IssueSearchResultItem record {
    string url;
    string repository_url;
    string labels_url;
    string comments_url;
    string events_url;
    string html_url;
    int id;
    string node_id;
    int number;
    string title;
    boolean locked;
    string? active_lock_reason?;
    SimpleUser[]? assignees?;
    simple-user user;
    record  { int id?; string node_id?; string url?; string name?; string color?; boolean 'default?; string? description?;} [] labels;
    string state;
    simple-user assignee;
    milestone milestone;
    int comments;
    string created_at;
    string updated_at;
    string? closed_at;
    SearchResultTextMatches text_matches?;
    record  { string? merged_at?; string? diff_url; string? html_url; string? patch_url; string? url;}  pull_request?;
    string body?;
    decimal score;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    boolean draft?;
    # A git repository
    Repository repository?;
    string body_html?;
    string body_text?;
    string timeline_url?;
    integration performed_via_github_app?;
};

public type ScimEnterpriseGroup record {
    string[] schemas;
    string id;
    string? externalId?;
    string displayName?;
    record  { string value?; string '\$ref?; string display?;} [] members?;
    record  { string resourceType?; string created?; string lastModified?; string location?;}  meta?;
};

# A git repository
public type Repository record {
    # Unique identifier of the repository
    int id;
    string node_id;
    # The name of the repository.
    string name;
    string full_name;
    license-simple license;
    simple-user organization?;
    int forks;
    record  { boolean admin; boolean pull; boolean triage?; boolean push; boolean maintain?;}  permissions?;
    simple-user owner;
    # Whether the repository is private or public.
    boolean 'private;
    string html_url;
    string? description;
    boolean 'fork;
    string url;
    string archive_url;
    string assignees_url;
    string blobs_url;
    string branches_url;
    string collaborators_url;
    string comments_url;
    string commits_url;
    string compare_url;
    string contents_url;
    string contributors_url;
    string deployments_url;
    string downloads_url;
    string events_url;
    string forks_url;
    string git_commits_url;
    string git_refs_url;
    string git_tags_url;
    string git_url;
    string issue_comment_url;
    string issue_events_url;
    string issues_url;
    string keys_url;
    string labels_url;
    string languages_url;
    string merges_url;
    string milestones_url;
    string notifications_url;
    string pulls_url;
    string releases_url;
    string ssh_url;
    string stargazers_url;
    string statuses_url;
    string subscribers_url;
    string subscription_url;
    string tags_url;
    string teams_url;
    string trees_url;
    string clone_url;
    string? mirror_url;
    string hooks_url;
    string svn_url;
    string? homepage;
    string? language;
    int forks_count;
    int stargazers_count;
    int watchers_count;
    int size;
    # The default branch of the repository.
    string default_branch;
    int open_issues_count;
    # Whether this repository acts as a template that can be used to generate new repositories.
    boolean is_template?;
    string[] topics?;
    # Whether issues are enabled.
    boolean has_issues;
    # Whether projects are enabled.
    boolean has_projects;
    # Whether the wiki is enabled.
    boolean has_wiki;
    boolean has_pages;
    # Whether downloads are enabled.
    boolean has_downloads;
    # Whether the repository is archived.
    boolean archived;
    # Returns whether or not this repository disabled.
    boolean disabled;
    # The repository visibility: public, private, or internal.
    string visibility?;
    string? pushed_at;
    string? created_at;
    string? updated_at;
    # Whether to allow rebase merges for pull requests.
    boolean allow_rebase_merge?;
    record  { int id?; string node_id?; string name?; string full_name?; record  { string login?; int id?; string node_id?; string avatar_url?; string gravatar_id?; string url?; string html_url?; string followers_url?; string following_url?; string gists_url?; string starred_url?; string subscriptions_url?; string organizations_url?; string repos_url?; string events_url?; string received_events_url?; string 'type?; boolean site_admin?;}  owner?; boolean 'private?; string html_url?; string description?; boolean 'fork?; string url?; string archive_url?; string assignees_url?; string blobs_url?; string branches_url?; string collaborators_url?; string comments_url?; string commits_url?; string compare_url?; string contents_url?; string contributors_url?; string deployments_url?; string downloads_url?; string events_url?; string forks_url?; string git_commits_url?; string git_refs_url?; string git_tags_url?; string git_url?; string issue_comment_url?; string issue_events_url?; string issues_url?; string keys_url?; string labels_url?; string languages_url?; string merges_url?; string milestones_url?; string notifications_url?; string pulls_url?; string releases_url?; string ssh_url?; string stargazers_url?; string statuses_url?; string subscribers_url?; string subscription_url?; string tags_url?; string teams_url?; string trees_url?; string clone_url?; string mirror_url?; string hooks_url?; string svn_url?; string homepage?; string language?; int forks_count?; int stargazers_count?; int watchers_count?; int size?; string default_branch?; int open_issues_count?; boolean is_template?; string[] topics?; boolean has_issues?; boolean has_projects?; boolean has_wiki?; boolean has_pages?; boolean has_downloads?; boolean archived?; boolean disabled?; string visibility?; string pushed_at?; string created_at?; string updated_at?; record  { boolean admin?; boolean push?; boolean pull?;}  permissions?; boolean allow_rebase_merge?; string temp_clone_token?; boolean allow_squash_merge?; boolean delete_branch_on_merge?; boolean allow_merge_commit?; int subscribers_count?; int network_count?;}  template_repository?;
    string temp_clone_token?;
    # Whether to allow squash merges for pull requests.
    boolean allow_squash_merge?;
    # Whether to delete head branches when pull requests are merged
    boolean delete_branch_on_merge?;
    # Whether to allow merge commits for pull requests.
    boolean allow_merge_commit?;
    int subscribers_count?;
    int network_count?;
    int open_issues;
    int watchers;
    string master_branch?;
    string starred_at?;
};

# Pull Request Review Comments are comments on a portion of the Pull Request's diff.
public type PullRequestReviewComment record {
    # URL for the pull request review comment
    string url;
    # The ID of the pull request review to which the comment belongs.
    int? pull_request_review_id;
    # The ID of the pull request review comment.
    int id;
    # The node ID of the pull request review comment.
    string node_id;
    # The diff of the line that the comment refers to.
    string diff_hunk;
    # The relative path of the file to which the comment applies.
    string path;
    # The line index in the diff to which the comment applies.
    int position;
    # The index of the original line in the diff to which the comment applies.
    int original_position;
    # The SHA of the commit to which the comment applies.
    string commit_id;
    # The SHA of the original commit to which the comment applies.
    string original_commit_id;
    # The comment ID to reply to.
    int in_reply_to_id?;
    # Simple User
    SimpleUser? user;
    # The text of the comment.
    string body;
    string created_at;
    string updated_at;
    # HTML URL for the pull request review comment.
    string html_url;
    # URL for the pull request that the review comment belongs to.
    string pull_request_url;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    record  { record  { string href;}  self; record  { string href;}  html; record  { string href;}  pull_request;}  _links;
    # The first line of the range for a multi-line comment.
    int? start_line?;
    # The first line of the range for a multi-line comment.
    int? original_start_line?;
    # The side of the first line of the range for a multi-line comment.
    string? start_side?;
    # The line of the blob to which the comment applies. The last line of the range for a multi-line comment
    int line?;
    # The line of the blob to which the comment applies. The last line of the range for a multi-line comment
    int original_line?;
    # The side of the diff to which the comment applies. The side of the last line of the range for a multi-line comment
    string side?;
    ReactionRollup reactions?;
    string body_html?;
    string body_text?;
};

# Minimal Repository
public type MinimalRepository record {
    int id;
    string node_id;
    string name;
    string full_name;
    record {} owner;
    boolean 'private;
    string html_url;
    string? description;
    boolean 'fork;
    string url;
    string archive_url;
    string assignees_url;
    string blobs_url;
    string branches_url;
    string collaborators_url;
    string comments_url;
    string commits_url;
    string compare_url;
    string contents_url;
    string contributors_url;
    string deployments_url;
    string downloads_url;
    string events_url;
    string forks_url;
    string git_commits_url;
    string git_refs_url;
    string git_tags_url;
    string git_url?;
    string issue_comment_url;
    string issue_events_url;
    string issues_url;
    string keys_url;
    string labels_url;
    string languages_url;
    string merges_url;
    string milestones_url;
    string notifications_url;
    string pulls_url;
    string releases_url;
    string ssh_url?;
    string stargazers_url;
    string statuses_url;
    string subscribers_url;
    string subscription_url;
    string tags_url;
    string teams_url;
    string trees_url;
    string clone_url?;
    string? mirror_url?;
    string hooks_url;
    string svn_url?;
    string? homepage?;
    string? language?;
    int forks_count?;
    int stargazers_count?;
    int watchers_count?;
    int size?;
    string default_branch?;
    int open_issues_count?;
    boolean is_template?;
    string[] topics?;
    boolean has_issues?;
    boolean has_projects?;
    boolean has_wiki?;
    boolean has_pages?;
    boolean has_downloads?;
    boolean archived?;
    boolean disabled?;
    string visibility?;
    string? pushed_at?;
    string? created_at?;
    string? updated_at?;
    record  { boolean admin?; boolean push?; boolean pull?; boolean maintain?; boolean triage?;}  permissions?;
    record {} template_repository?;
    string temp_clone_token?;
    boolean delete_branch_on_merge?;
    int subscribers_count?;
    int network_count?;
    # Code Of Conduct
    CodeOfConduct code_of_conduct?;
    record  { string 'key?; string name?; string spdx_id?; string url?; string node_id?;}  license?;
    int forks?;
    int open_issues?;
    int watchers?;
};

# Timeline Assigned Issue Event
public type TimelineAssignedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    # Simple User
    SimpleUser? assignee;
};

# The amount of time to delay a job after the job is initially triggered. The time (in minutes) must be an integer between 0 and 43,200 (30 days).
#
public type WaitTimer int;

# Gist Commit
public type GistCommit record {
    string url;
    string 'version;
    simple-user user;
    record  { int total?; int additions?; int deletions?;}  change_status;
    string committed_at;
};

# Page Build
public type PageBuild record {
    string url;
    string status;
    record  { string? message;}  _error;
    simple-user pusher;
    string 'commit;
    int duration;
    string created_at;
    string updated_at;
};

# Event
public type Event record {
    string id;
    string? 'type;
    # Actor
    Actor actor;
    record  { int id; string name; string url;}  repo;
    # Actor
    Actor org?;
    record  { string action?; # Issue Simple
        IssueSimple issue?; # Comments provide a way for people to collaborate on an issue.
        IssueComment comment?; record  { string page_name?; string title?; string? summary?; string action?; string sha?; string html_url?;} [] pages?;}  payload;
    boolean 'public;
    string? created_at;
};

# Starred Repository
public type StarredRepository record {
    string starred_at;
    # A git repository
    Repository repo;
};

# Moved Column in Project Issue Event
public type MovedColumnInProjectIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { int id; string url; int project_id; string project_url; string column_name; string previous_column_name?;}  project_card?;
};

# Issues are a great way to keep track of tasks, enhancements, and bugs for your projects.
public type Issue record {
    int id;
    string node_id;
    # URL for the issue
    string url;
    string repository_url;
    string labels_url;
    string comments_url;
    string events_url;
    string html_url;
    # Number uniquely identifying the issue within its repository
    int number;
    # State of the issue; either 'open' or 'closed'
    string state;
    # Title of the issue
    string title;
    # Contents of the issue
    string? body?;
    simple-user user;
    # Labels to associate with this issue; pass one or more label names to replace the set of labels on this issue; send an empty array to clear all labels from the issue; note that the labels are silently dropped for users without push access to the repository
    anydata[] labels;
    simple-user assignee;
    SimpleUser[]? assignees?;
    milestone milestone;
    boolean locked;
    string? active_lock_reason?;
    int comments;
    record  { string? merged_at?; string? diff_url; string? html_url; string? patch_url; string? url;}  pull_request?;
    string? closed_at;
    string created_at;
    string updated_at;
    simple-user closed_by?;
    string body_html?;
    string body_text?;
    string timeline_url?;
    # A git repository
    Repository repository?;
    integration performed_via_github_app?;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    ReactionRollup reactions?;
};

# Email
public type Email record {
    string email;
    boolean primary;
    boolean verified;
    string? visibility;
};

# A unique encryption key
public type GpgKey record {
    int id;
    int? primary_key_id;
    string key_id;
    string public_key;
    record  { string email?; boolean verified?;} [] emails;
    record  { int id?; int primary_key_id?; string key_id?; string public_key?; anydata[] emails?; anydata[] subkeys?; boolean can_sign?; boolean can_encrypt_comms?; boolean can_encrypt_storage?; boolean can_certify?; string created_at?; string? expires_at?; string? raw_key?;} [] subkeys;
    boolean can_sign;
    boolean can_encrypt_comms;
    boolean can_encrypt_storage;
    boolean can_certify;
    string created_at;
    string? expires_at;
    string? raw_key;
};

# Key Simple
public type KeySimple record {
    int id;
    string 'key;
};

# Issue Simple
public type IssueSimple record {
    int id;
    string node_id;
    string url;
    string repository_url;
    string labels_url;
    string comments_url;
    string events_url;
    string html_url;
    int number;
    string state;
    string title;
    string body?;
    simple-user user;
    Label[] labels;
    simple-user assignee;
    SimpleUser[]? assignees?;
    milestone milestone;
    boolean locked;
    string? active_lock_reason?;
    int comments;
    record  { string? merged_at?; string? diff_url; string? html_url; string? patch_url; string? url;}  pull_request?;
    string? closed_at;
    string created_at;
    string updated_at;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    string body_html?;
    string body_text?;
    string timeline_url?;
    # A git repository
    Repository repository?;
    integration performed_via_github_app?;
};

# An SSH key granting access to a single repository.
public type DeployKey record {
    int id;
    string 'key;
    string url;
    string title;
    boolean verified;
    string created_at;
    boolean read_only;
};

# Repository invitations let you manage who you collaborate with.
public type RepositorySubscription record {
    # Determines if notifications should be received from this repository.
    boolean subscribed;
    # Determines if all notifications should be blocked from this repository.
    boolean ignored;
    string? reason;
    string created_at;
    string url;
    string repository_url;
};

# Color-coded labels help you categorize and filter your issues (just like labels in Gmail).
public type Label record {
    int id;
    string node_id;
    # URL for the label
    string url;
    # The name of the label.
    string name;
    string? description;
    # 6-character hex code, without the leading #, identifying the color
    string color;
    boolean 'default;
};

# A request for a specific ref(branch,sha,tag) to be deployed
public type Deployment record {
    string url;
    # Unique identifier of the deployment
    int id;
    string node_id;
    string sha;
    # The ref to deploy. This can be a branch, tag, or sha.
    string ref;
    # Parameter to specify a task to execute
    string task;
    record {}|string payload;
    string original_environment?;
    # Name for the target deployment environment.
    string environment;
    string? description;
    simple-user creator;
    string created_at;
    string updated_at;
    string statuses_url;
    string repository_url;
    # Specifies if the given environment is will no longer exist at some point in the future. Default: false.
    boolean transient_environment?;
    # Specifies if the given environment is one that end-users directly interact with. Default: false.
    boolean production_environment?;
    integration performed_via_github_app?;
};

# Code Frequency Stat
#
# + int - Code Frequency Stat
public type CodeFrequencyStat int[];

# The configuration for GitHub Pages for a repository.
public type Page record {
    # The API address for accessing this Page resource.
    string url;
    # The status of the most recent build of the Page.
    string? status;
    # The Pages site's custom domain
    string? cname;
    # Whether the Page has a custom 404 page.
    boolean custom_404;
    # The web address the Page can be accessed from.
    string html_url?;
    PagesSourceHash 'source?;
    # Whether the GitHub Pages site is publicly visible. If set to `true`, the site is accessible to anyone on the internet. If set to `false`, the site will only be accessible to users who have at least `read` access to the repository that published the site.
    boolean 'public;
    PagesHttpsCertificate https_certificate?;
    # Whether https is enabled on the domain
    boolean https_enforced?;
};

# License Content
public type LicenseContent record {
    string name;
    string path;
    string sha;
    int size;
    string url;
    string? html_url;
    string? git_url;
    string? download_url;
    string 'type;
    string content;
    string encoding;
    record  { string? git; string? html; string self;}  _links;
    license-simple license;
};

# Short Blob
public type ShortBlob record {
    string url;
    string sha;
};

# The type of GitHub user that can comment, open issues, or create pull requests while the interaction limit is in effect. Can be one of: `existing_users`, `contributors_only`, `collaborators_only`.
#
public type InteractionGroup string;

public type ActionsRepositoryPermissions record {
    # Whether GitHub Actions is enabled on the repository.
    ActionsEnabled enabled;
    # The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
    AllowedActions allowed_actions?;
    # The API URL to use to get or set the actions that are allowed to run, when `allowed_actions` is set to `selected`.
    SelectedActionsUrl selected_actions_url?;
};

public type ScimUserListEnterprise record {
    string[] schemas;
    decimal totalResults;
    decimal itemsPerPage;
    decimal startIndex;
    record  { string[] schemas; string id; string externalId?; string userName?; record  { string givenName?; string familyName?;}  name?; record  { string value?; boolean primary?; string 'type?;} [] emails?; record  { string value?;} [] groups?; boolean active?; record  { string resourceType?; string created?; string lastModified?; string location?;}  meta?;} [] Resources;
};

# Details of a deployment that is waiting for protection rules to pass
public type PendingDeployment record {
    record  { # The id of the environment.
        int id?; string node_id?; # The name of the environment.
        string name?; string url?; string html_url?;}  environment;
    # The set duration of the wait timer
    int wait_timer;
    # The time that the wait timer began.
    string? wait_timer_started_at;
    # Whether the currently authenticated user can approve the deployment
    boolean current_user_can_approve;
    # The people or teams that may approve jobs that reference the environment. You can list up to six users or teams as reviewers. The reviewers must have at least read access to the repository. Only one of the required reviewers needs to approve the job for it to proceed.
    record  { # The type of reviewer. Must be one of: `User` or `Team`
        DeploymentReviewerType 'type?; simple-user|team reviewer?;} [] reviewers;
};

# The permissions granted to the user-to-server access token.
public type AppPermissions record {
    # The level of permission to grant the access token for GitHub Actions workflows, workflow runs, and artifacts. Can be one of: `read` or `write`.
    string actions?;
    # The level of permission to grant the access token for repository creation, deletion, settings, teams, and collaborators creation. Can be one of: `read` or `write`.
    string administration?;
    # The level of permission to grant the access token for checks on code. Can be one of: `read` or `write`.
    string checks?;
    # The level of permission to grant the access token for notification of content references and creation content attachments. Can be one of: `read` or `write`.
    string content_references?;
    # The level of permission to grant the access token for repository contents, commits, branches, downloads, releases, and merges. Can be one of: `read` or `write`.
    string contents?;
    # The level of permission to grant the access token for deployments and deployment statuses. Can be one of: `read` or `write`.
    string deployments?;
    # The level of permission to grant the access token for managing repository environments. Can be one of: `read` or `write`.
    string environments?;
    # The level of permission to grant the access token for issues and related comments, assignees, labels, and milestones. Can be one of: `read` or `write`.
    string issues?;
    # The level of permission to grant the access token to search repositories, list collaborators, and access repository metadata. Can be one of: `read` or `write`.
    string metadata?;
    # The level of permission to grant the access token for packages published to GitHub Packages. Can be one of: `read` or `write`.
    string packages?;
    # The level of permission to grant the access token to retrieve Pages statuses, configuration, and builds, as well as create new builds. Can be one of: `read` or `write`.
    string pages?;
    # The level of permission to grant the access token for pull requests and related comments, assignees, labels, milestones, and merges. Can be one of: `read` or `write`.
    string pull_requests?;
    # The level of permission to grant the access token to manage the post-receive hooks for a repository. Can be one of: `read` or `write`.
    string repository_hooks?;
    # The level of permission to grant the access token to manage repository projects, columns, and cards. Can be one of: `read`, `write`, or `admin`.
    string repository_projects?;
    # The level of permission to grant the access token to view and manage secret scanning alerts. Can be one of: `read` or `write`.
    string secret_scanning_alerts?;
    # The level of permission to grant the access token to manage repository secrets. Can be one of: `read` or `write`.
    string secrets?;
    # The level of permission to grant the access token to view and manage security events like code scanning alerts. Can be one of: `read` or `write`.
    string security_events?;
    # The level of permission to grant the access token to manage just a single file. Can be one of: `read` or `write`.
    string single_file?;
    # The level of permission to grant the access token for commit statuses. Can be one of: `read` or `write`.
    string statuses?;
    # The level of permission to grant the access token to retrieve Dependabot alerts. Can be one of: `read`.
    string vulnerability_alerts?;
    # The level of permission to grant the access token to update GitHub Actions workflow files. Can be one of: `write`.
    string workflows?;
    # The level of permission to grant the access token for organization teams and members. Can be one of: `read` or `write`.
    string members?;
    # The level of permission to grant the access token to manage access to an organization. Can be one of: `read` or `write`.
    string organization_administration?;
    # The level of permission to grant the access token to manage the post-receive hooks for an organization. Can be one of: `read` or `write`.
    string organization_hooks?;
    # The level of permission to grant the access token for viewing an organization's plan. Can be one of: `read`.
    string organization_plan?;
    # The level of permission to grant the access token to manage organization projects, columns, and cards. Can be one of: `read`, `write`, or `admin`.
    string organization_projects?;
    # The level of permission to grant the access token for organization packages published to GitHub Packages. Can be one of: `read` or `write`.
    string organization_packages?;
    # The level of permission to grant the access token to manage organization secrets. Can be one of: `read` or `write`.
    string organization_secrets?;
    # The level of permission to grant the access token to view and manage GitHub Actions self-hosted runners available to an organization. Can be one of: `read` or `write`.
    string organization_self_hosted_runners?;
    # The level of permission to grant the access token to view and manage users blocked by the organization. Can be one of: `read` or `write`.
    string organization_user_blocking?;
    # The level of permission to grant the access token to manage team discussions and related comments. Can be one of: `read` or `write`.
    string team_discussions?;
};

# Timeline Event
#
public type  TimelineIssueEvents labeled-issue-event|unlabeled-issue-event|milestoned-issue-event|demilestoned-issue-event|renamed-issue-event|review-requested-issue-event|review-request-removed-issue-event|review-dismissed-issue-event|locked-issue-event|added-to-project-issue-event|moved-column-in-project-issue-event|removed-from-project-issue-event|converted-note-to-issue-issue-event|timeline-comment-event|timeline-cross-referenced-event|timeline-committed-event|timeline-reviewed-event|timeline-line-commented-event|timeline-commit-commented-event|timeline-assigned-issue-event|timeline-unassigned-issue-event;

public type CodeScanningAlert record {
    # The security alert number.
    AlertNumber number;
    # The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    AlertCreatedAt created_at;
    # The REST API URL of the alert resource.
    AlertUrl url;
    # The GitHub URL of the alert resource.
    AlertHtmlUrl html_url;
    anydata instances?;
    # The REST API URL for fetching the list of instances for an alert.
    AlertInstancesUrl instances_url;
    # State of a code scanning alert.
    CodeScanningAlertState state;
    # Simple User
    SimpleUser? dismissed_by;
    # The time that the alert was dismissed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    CodeScanningAlertDismissedAt? dismissed_at;
    # **Required when the state is dismissed.** The reason for dismissing or closing the alert. Can be one of: `false positive`, `won't fix`, and `used in tests`.
    CodeScanningAlertDismissedReason? dismissed_reason;
    CodeScanningAlertRule rule;
    CodeScanningAnalysisTool tool;
    CodeScanningAlertInstance most_recent_instance;
};

# Interaction limit settings.
public type InteractionLimitResponse record {
    # The type of GitHub user that can comment, open issues, or create pull requests while the interaction limit is in effect. Can be one of: `existing_users`, `contributors_only`, `collaborators_only`.
    InteractionGroup 'limit;
    string origin;
    string expires_at;
};

public type ParticipationStats record {
    int[] 'all;
    int[] owner;
};

public type CodeScanningAlertInstance record {
    # The full Git reference, formatted as `refs/heads/<branch name>`,
    CodeScanningRef ref?;
    # Identifies the configuration under which the analysis was executed. For example, in GitHub Actions this includes the workflow filename and job name.
    CodeScanningAnalysisAnalysisKey analysis_key?;
    # Identifies the variable values associated with the environment in which the analysis that generated this alert instance was performed, such as the language that was analyzed.
    CodeScanningAlertEnvironment environment?;
    # State of a code scanning alert.
    CodeScanningAlertState state?;
    string commit_sha?;
    record  { string text?;}  message?;
    # Describe a region within a file for the alert.
    CodeScanningAlertLocation location?;
    string html_url?;
    # Classifications that have been applied to the file that triggered the alert.
    CodeScanningAlertClassification[] classifications?;
};

# A list of directory items
#
# + record { string'type;intsize;stringname;stringpath;stringcontent?;stringsha;stringurl;string?git_url;string?html_url;string?download_url;record { string?git;string?html;stringself;} _links;}  - A list of directory items
public type ContentDirectory record { string'type;intsize;stringname;stringpath;stringcontent?;stringsha;stringurl;string?git_url;string?html_url;string?download_url;record { string?git;string?html;stringself;} _links;}[];

# Git references within a repository
public type GitRef record {
    string ref;
    string node_id;
    string url;
    record  { string 'type; # SHA for the reference
        string sha; string url;}  'object;
};

# The full Git reference, formatted as `refs/heads/<branch name>`,
`refs/pull/<number>/merge`, or `refs/pull/<number>/head`.
#
public type CodeScanningRef string;

# A collection of related issues and pull requests.
public type Milestone record {
    string url;
    string html_url;
    string labels_url;
    int id;
    string node_id;
    # The number of the milestone.
    int number;
    # The state of the milestone.
    string state;
    # The title of the milestone.
    string title;
    string? description;
    simple-user creator;
    int open_issues;
    int closed_issues;
    string created_at;
    string updated_at;
    string? closed_at;
    string? due_on;
};

# Status Check Policy
public type StatusCheckPolicy record {
    string url;
    boolean strict;
    string[] contexts;
    string contexts_url;
};

# User Search Result Item
public type UserSearchResultItem record {
    string login;
    int id;
    string node_id;
    string avatar_url;
    string? gravatar_id;
    string url;
    string html_url;
    string followers_url;
    string subscriptions_url;
    string organizations_url;
    string repos_url;
    string received_events_url;
    string 'type;
    decimal score;
    string following_url;
    string gists_url;
    string starred_url;
    string events_url;
    int public_repos?;
    int public_gists?;
    int followers?;
    int following?;
    string created_at?;
    string updated_at?;
    string? name?;
    string? bio?;
    string? email?;
    string? location?;
    boolean site_admin;
    boolean? hireable?;
    SearchResultTextMatches text_matches?;
    string? blog?;
    string? company?;
    string? suspended_at?;
};

# Clone Traffic
public type CloneTraffic record {
    int count;
    int uniques;
    Traffic[] clones;
};

public type MarketplaceAccount record {
    string url;
    int id;
    string 'type;
    string node_id?;
    string login;
    string? email?;
    string? organization_billing_email?;
};

# A classification of the file. For example to identify it as generated.
#
public type CodeScanningAlertClassification string;

# Protected Branch Admin Enforced
public type ProtectedBranchAdminEnforced record {
    string url;
    boolean enabled;
};

# The REST API URL of the alert resource.
#
public type AlertUrl string;

# Timeline Reviewed Event
public type TimelineReviewedEvent record {
    string event;
    # Unique identifier of the review
    int id;
    string node_id;
    # Simple User
    SimpleUser? user;
    # The text of the review.
    string? body;
    string state;
    string html_url;
    string pull_request_url;
    record  { record  { string href;}  html; record  { string href;}  pull_request;}  _links;
    string submitted_at?;
    # A commit SHA for the review.
    string commit_id;
    string body_html?;
    string body_text?;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
};

# Content Traffic
public type ContentTraffic record {
    string path;
    string title;
    int count;
    int uniques;
};

# The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
#
public type AlertCreatedAt string;

public type CommunityHealthFile record {
    string url;
    string html_url;
};

# An identifier for the upload.
#
public type CodeScanningAnalysisSarifId string;

public type SimpleCommitStatus record {
    string? description;
    int id;
    string node_id;
    string state;
    string context;
    string target_url;
    boolean? required?;
    string? avatar_url;
    string url;
    string created_at;
    string updated_at;
};

# Code Of Conduct
public type CodeOfConduct record {
    string 'key;
    string name;
    string url;
    string body?;
    string? html_url;
};

# User Marketplace Purchase
public type UserMarketplacePurchase record {
    string billing_cycle;
    string? next_billing_date;
    int? unit_count;
    boolean on_free_trial;
    string? free_trial_ends_on;
    string? updated_at;
    MarketplaceAccount account;
    # Marketplace Listing Plan
    MarketplaceListingPlan plan;
};

# Low-level Git commit operations within a repository
public type GitCommit record {
    # SHA for the commit
    string sha;
    string node_id;
    string url;
    # Identifying information for the git-user
    record  { # Timestamp of the commit
        string date; # Git email address of the user
        string email; # Name of the git user
        string name;}  author;
    # Identifying information for the git-user
    record  { # Timestamp of the commit
        string date; # Git email address of the user
        string email; # Name of the git user
        string name;}  committer;
    # Message describing the purpose of the commit
    string message;
    record  { # SHA for the commit
        string sha; string url;}  tree;
    record  { # SHA for the commit
        string sha; string url; string html_url;} [] parents;
    record  { boolean verified; string reason; string? signature; string? payload;}  verification;
    string html_url;
};

# Credential Authorization
public type CredentialAuthorization record {
    # User login that owns the underlying credential.
    string login;
    # Unique identifier for the credential.
    int credential_id;
    # Human-readable description of the credential type.
    string credential_type;
    # Last eight characters of the credential. Only included in responses with credential_type of personal access token.
    string token_last_eight?;
    # Date when the credential was authorized for use.
    string credential_authorized_at;
    # List of oauth scopes the token has been granted.
    string[] scopes?;
    # Unique string to distinguish the credential. Only included in responses with credential_type of SSH Key.
    string fingerprint?;
    # Date when the credential was last accessed. May be null if it was never accessed
    string? credential_accessed_at?;
    int? authorized_credential_id?;
    # The title given to the ssh key. This will only be present when the credential is an ssh key.
    string? authorized_credential_title?;
    # The note given to the token. This will only be present when the credential is a token.
    string? authorized_credential_note?;
};

# Contributor
public type Contributor record {
    string login?;
    int id?;
    string node_id?;
    string avatar_url?;
    string? gravatar_id?;
    string url?;
    string html_url?;
    string followers_url?;
    string following_url?;
    string gists_url?;
    string starred_url?;
    string subscriptions_url?;
    string organizations_url?;
    string repos_url?;
    string events_url?;
    string received_events_url?;
    string 'type;
    boolean site_admin?;
    int contributions;
    string email?;
    string name?;
};

# A reply to a discussion within a team.
public type TeamDiscussionComment record {
    simple-user author;
    # The main text of the comment.
    string body;
    string body_html;
    # The current version of the body content. If provided, this update operation will be rejected if the given version does not match the latest version on the server.
    string body_version;
    string created_at;
    string? last_edited_at;
    string discussion_url;
    string html_url;
    string node_id;
    # The unique sequence number of a team discussion comment.
    int number;
    string updated_at;
    string url;
    ReactionRollup reactions?;
};

# Gitignore Template
public type GitignoreTemplate record {
    string name;
    string 'source;
};

# An entry in the reviews log for environment deployments
public type EnvironmentApprovals record {
    # The list of environments that were approved or rejected
    record  { # The id of the environment.
        int id?; string node_id?; # The name of the environment.
        string name?; string url?; string html_url?; # The time that the environment was created, in ISO 8601 format.
        string created_at?; # The time that the environment was last updated, in ISO 8601 format.
        string updated_at?;} [] environments;
    # Whether deployment to the environment(s) was approved or rejected
    string state;
    # Simple User
    SimpleUser? user;
    # The comment submitted with the deployment review
    string comment;
};

# Language
#
public type Language record {};

# An object without any properties.
public type EmptyObject record {
};

# Combined Commit Status
public type CombinedCommitStatus record {
    string state;
    SimpleCommitStatus[] statuses;
    string sha;
    int total_count;
    # Minimal Repository
    MinimalRepository repository;
    string commit_url;
    string url;
};

# Delivery made by a webhook.
public type HookDelivery record {
    # Unique identifier of the delivery.
    int id;
    # Unique identifier for the event (shared with all deliveries for all webhooks that subscribe to this event).
    string guid;
    # Time when the delivery was delivered.
    string delivered_at;
    # Whether the delivery is a redelivery.
    boolean redelivery;
    # Time spent delivering.
    decimal duration;
    # Description of the status of the attempted delivery
    string status;
    # Status code received when delivery was made.
    int status_code;
    # The event that triggered the delivery.
    string event;
    # The type of activity for the event that triggered the delivery.
    string? action;
    # The id of the GitHub App installation associated with this event.
    int? installation_id;
    # The id of the repository associated with this event.
    int? repository_id;
    record  { # The request headers sent with the webhook delivery.
        record {} headers; # The webhook payload.
        record {} payload;}  request;
    record  { # The response headers received when the delivery was made.
        record {} headers; # The response payload received.
        record {} payload;}  response;
};

# Code of Conduct Simple
public type CodeOfConductSimple record {
    string url;
    string 'key;
    string name;
    string? html_url;
};

# Locked Issue Event
public type LockedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    string? lock_reason;
};

public type ScimEnterpriseUser record {
    string[] schemas;
    string id;
    string externalId?;
    string userName?;
    record  { string givenName?; string familyName?;}  name?;
    record  { string value?; string 'type?; boolean primary?;} [] emails?;
    record  { string value?;} [] groups?;
    boolean active?;
    record  { string resourceType?; string created?; string lastModified?; string location?;}  meta?;
};

# The status of auto merging a pull request.
public type AutoMerge record {
    # Simple User
    SimpleUser? enabled_by;
    # The merge method to use.
    string merge_method;
    # Title for the merge commit message.
    string commit_title;
    # Commit message for the merge commit.
    string commit_message;
};

public type ActionsEnterprisePermissions record {
    # The policy that controls the organizations in the enterprise that are allowed to run GitHub Actions. Can be one of: `all`, `none`, or `selected`.
    EnabledOrganizations enabled_organizations;
    # The API URL to use to get or set the selected organizations that are allowed to run GitHub Actions, when `enabled_organizations` is set to `selected`.
    string selected_organizations_url?;
    # The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
    AllowedActions allowed_actions?;
    # The API URL to use to get or set the actions that are allowed to run, when `allowed_actions` is set to `selected`.
    SelectedActionsUrl selected_actions_url?;
};

# Hovercard
public type Hovercard record {
    record  { string message; string octicon;} [] contexts;
};

# Legacy Review Comment
public type ReviewComment record {
    string url;
    int? pull_request_review_id;
    int id;
    string node_id;
    string diff_hunk;
    string path;
    int? position;
    int original_position;
    string commit_id;
    string original_commit_id;
    int in_reply_to_id?;
    simple-user user;
    string body;
    string created_at;
    string updated_at;
    string html_url;
    string pull_request_url;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    record  { # Hypermedia Link
        Link self; # Hypermedia Link
        Link html; # Hypermedia Link
        Link pull_request;}  _links;
    string body_text?;
    string body_html?;
    ReactionRollup reactions?;
    # The side of the first line of the range for a multi-line comment.
    string side?;
    # The side of the first line of the range for a multi-line comment.
    string? start_side?;
    # The line of the blob to which the comment applies. The last line of the range for a multi-line comment
    int line?;
    # The original line of the blob to which the comment applies. The last line of the range for a multi-line comment
    int original_line?;
    # The first line of the range for a multi-line comment.
    int? start_line?;
    # The original first line of the range for a multi-line comment.
    int? original_start_line?;
};

# Organization Invitation
public type OrganizationInvitation record {
    int id;
    string? login;
    string? email;
    string role;
    string created_at;
    string? failed_at?;
    string? failed_reason?;
    # Simple User
    SimpleUser? inviter;
    int team_count;
    string node_id;
    string invitation_teams_url;
};

# A team's access to a repository.
public type TeamRepository record {
    # Unique identifier of the repository
    int id;
    string node_id;
    # The name of the repository.
    string name;
    string full_name;
    license-simple license;
    int forks;
    record  { boolean admin; boolean pull; boolean triage?; boolean push; boolean maintain?;}  permissions?;
    simple-user owner;
    # Whether the repository is private or public.
    boolean 'private;
    string html_url;
    string? description;
    boolean 'fork;
    string url;
    string archive_url;
    string assignees_url;
    string blobs_url;
    string branches_url;
    string collaborators_url;
    string comments_url;
    string commits_url;
    string compare_url;
    string contents_url;
    string contributors_url;
    string deployments_url;
    string downloads_url;
    string events_url;
    string forks_url;
    string git_commits_url;
    string git_refs_url;
    string git_tags_url;
    string git_url;
    string issue_comment_url;
    string issue_events_url;
    string issues_url;
    string keys_url;
    string labels_url;
    string languages_url;
    string merges_url;
    string milestones_url;
    string notifications_url;
    string pulls_url;
    string releases_url;
    string ssh_url;
    string stargazers_url;
    string statuses_url;
    string subscribers_url;
    string subscription_url;
    string tags_url;
    string teams_url;
    string trees_url;
    string clone_url;
    string? mirror_url;
    string hooks_url;
    string svn_url;
    string? homepage;
    string? language;
    int forks_count;
    int stargazers_count;
    int watchers_count;
    int size;
    # The default branch of the repository.
    string default_branch;
    int open_issues_count;
    # Whether this repository acts as a template that can be used to generate new repositories.
    boolean is_template?;
    string[] topics?;
    # Whether issues are enabled.
    boolean has_issues;
    # Whether projects are enabled.
    boolean has_projects;
    # Whether the wiki is enabled.
    boolean has_wiki;
    boolean has_pages;
    # Whether downloads are enabled.
    boolean has_downloads;
    # Whether the repository is archived.
    boolean archived;
    # Returns whether or not this repository disabled.
    boolean disabled;
    # The repository visibility: public, private, or internal.
    string visibility?;
    string? pushed_at;
    string? created_at;
    string? updated_at;
    # Whether to allow rebase merges for pull requests.
    boolean allow_rebase_merge?;
    record {} template_repository?;
    string temp_clone_token?;
    # Whether to allow squash merges for pull requests.
    boolean allow_squash_merge?;
    # Whether to delete head branches when pull requests are merged
    boolean delete_branch_on_merge?;
    # Whether to allow merge commits for pull requests.
    boolean allow_merge_commit?;
    int subscribers_count?;
    int network_count?;
    int open_issues;
    int watchers;
    string master_branch?;
};

# Converted Note to Issue Issue Event
public type ConvertedNoteToIssueIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { int id; string url; int project_id; string project_url; string column_name; string previous_column_name?;}  project_card?;
};

# Assigned Issue Event
public type AssignedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    # Simple User
    SimpleUser? assignee;
    # Simple User
    SimpleUser? assigner;
};

# Page Build Status
public type PageBuildStatus record {
    string url;
    string status;
};

# Gist Simple
public type GistSimple record {
    record  { string id?; string url?; # Public User
        PublicUser user?; string created_at?; string updated_at?;} [] forks?;
    GistHistory[]? history?;
    # Gist
    record  { string url; string forks_url; string commits_url; string id; string node_id; string git_pull_url; string git_push_url; string html_url; record {} files; boolean 'public; string created_at; string updated_at; string? description; int comments; simple-user user; string comments_url; simple-user owner?; boolean truncated?; anydata[] forks?; anydata[] history?;}  fork_of?;
    string url?;
    string forks_url?;
    string commits_url?;
    string id?;
    string node_id?;
    string git_pull_url?;
    string git_push_url?;
    string html_url?;
    record {} files?;
    boolean 'public?;
    string created_at?;
    string updated_at?;
    string? description?;
    int comments?;
    string? user?;
    string comments_url?;
    # Simple User
    SimpleUser? owner?;
    boolean truncated?;
};

# Groups of organization members that gives permissions on specified repositories.
public type TeamFull record {
    # Unique identifier of the team
    int id;
    string node_id;
    # URL for the team
    string url;
    string html_url;
    # Name of the team
    string name;
    string slug;
    string? description;
    # The level of privacy this team should have
    string privacy?;
    # Permission that the team will have for its repositories
    string permission;
    string members_url;
    string repositories_url;
    team-simple parent?;
    int members_count;
    int repos_count;
    string created_at;
    string updated_at;
    # Organization Full
    OrganizationFull organization;
    # Distinguished Name (DN) that team maps to within LDAP environment
    string ldap_dn?;
};

# Branch With Protection
public type BranchWithProtection record {
    string name;
    # Commit
    Commit 'commit;
    record  { string html; string self;}  _links;
    boolean protected;
    # Branch Protection
    BranchProtection protection;
    string protection_url;
    string pattern?;
    int required_approving_review_count?;
};

# Collaborator
public type Collaborator record {
    string login;
    int id;
    string? email?;
    string? name?;
    string node_id;
    string avatar_url;
    string? gravatar_id;
    string url;
    string html_url;
    string followers_url;
    string following_url;
    string gists_url;
    string starred_url;
    string subscriptions_url;
    string organizations_url;
    string repos_url;
    string events_url;
    string received_events_url;
    string 'type;
    boolean site_admin;
    record  { boolean pull; boolean push; boolean admin;}  permissions?;
};

# Project cards represent a scope of work.
public type ProjectCard record {
    string url;
    # The project card's ID
    int id;
    string node_id;
    string? note;
    simple-user creator;
    string created_at;
    string updated_at;
    # Whether or not the card is archived
    boolean archived?;
    string column_name?;
    string project_id?;
    string column_url;
    string content_url?;
    string project_url;
};

# Successful deletion of a code scanning analysis
public type CodeScanningAnalysisDeletion record {
    # Next deletable analysis in chain, without last analysis deletion confirmation
    string? next_analysis_url;
    # Next deletable analysis in chain, with last analysis deletion confirmation
    string? confirm_delete_url;
};

# Gist History
public type GistHistory record {
    # Simple User
    SimpleUser? user?;
    string 'version?;
    string committed_at?;
    record  { int total?; int additions?; int deletions?;}  change_status?;
    string url?;
};

# Issue Event Rename
public type IssueEventRename record {
    string 'from;
    string to;
};

# SCIM User List
public type ScimUserList record {
    # SCIM schema used.
    string[] schemas;
    int totalResults;
    int itemsPerPage;
    int startIndex;
    ScimUser[] Resources;
};

# Basic Error
public type BasicError record {
    string message?;
    string documentation_url?;
    string url?;
    string status?;
};

# The policy that controls the repositories in the organization that are allowed to run GitHub Actions. Can be one of: `all`, `none`, or `selected`.
#
public type EnabledRepositories string;

# Repository invitations let you manage who you collaborate with.
public type RepositoryInvitation record {
    # Unique identifier of the repository invitation.
    int id;
    # Minimal Repository
    MinimalRepository repository;
    simple-user invitee;
    simple-user inviter;
    # The permission associated with the invitation.
    string permissions;
    string created_at;
    # Whether or not the invitation has expired
    boolean expired?;
    # URL for the repository invitation
    string url;
    string html_url;
    string node_id;
};

# Issue Event Project Card
public type IssueEventProjectCard record {
    string url;
    int id;
    string project_url;
    int project_id;
    string column_name;
    string previous_column_name?;
};

# A repository import from an external source.
public type Import record {
    string? vcs;
    boolean use_lfs?;
    # The URL of the originating repository.
    string vcs_url;
    string svc_root?;
    string tfvc_project?;
    string status;
    string? status_text?;
    string? failed_step?;
    string? error_message?;
    int? import_percent?;
    int? commit_count?;
    int? push_percent?;
    boolean has_large_files?;
    int large_files_size?;
    int large_files_count?;
    record  { string vcs?; string tfvc_project?; string human_name?;} [] project_choices?;
    string message?;
    int? authors_count?;
    string url;
    string html_url;
    string authors_url;
    string repository_url;
    string svn_root?;
};

# Review Dismissed Issue Event
public type ReviewDismissedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { string state; int review_id; string? dismissal_message; string dismissal_commit_id?;}  dismissed_review;
};

# Marketplace Purchase
public type MarketplacePurchase record {
    string url;
    string 'type;
    int id;
    string login;
    string organization_billing_email?;
    string? email?;
    record  { boolean is_installed?; string effective_date?; int? unit_count?; int id?; # Marketplace Listing Plan
        MarketplaceListingPlan plan?;}  marketplace_pending_change?;
    record  { string billing_cycle?; string? next_billing_date?; boolean is_installed?; int? unit_count?; boolean on_free_trial?; string? free_trial_ends_on?; string updated_at?; # Marketplace Listing Plan
        MarketplaceListingPlan plan?;}  marketplace_purchase;
};

# A migration.
public type Migration record {
    int id;
    simple-user owner;
    string guid;
    string state;
    boolean lock_repositories;
    boolean exclude_attachments;
    Repository[] repositories;
    string url;
    string created_at;
    string updated_at;
    string node_id;
    string archive_url?;
    anydata[] exclude?;
};

public type IssueEventDismissedReview record {
    string state;
    int review_id;
    string? dismissal_message;
    string? dismissal_commit_id?;
};

# Pull requests let you tell others about changes you've pushed to a repository on GitHub. Once a pull request is sent, interested parties can review the set of changes, discuss potential modifications, and even push follow-up commits if necessary.
public type PullRequest record {
    string url;
    int id;
    string node_id;
    string html_url;
    string diff_url;
    string patch_url;
    string issue_url;
    string commits_url;
    string review_comments_url;
    string review_comment_url;
    string comments_url;
    string statuses_url;
    # Number uniquely identifying the pull request within its repository.
    int number;
    # State of this Pull Request. Either `open` or `closed`.
    string state;
    boolean locked;
    # The title of the pull request.
    string title;
    simple-user user;
    string? body;
    record  { int id?; string node_id?; string url?; string name?; string? description?; string color?; boolean 'default?;} [] labels;
    milestone milestone;
    string? active_lock_reason?;
    string created_at;
    string updated_at;
    string? closed_at;
    string? merged_at;
    string? merge_commit_sha;
    simple-user assignee;
    SimpleUser[]? assignees?;
    SimpleUser[]? requested_reviewers?;
    TeamSimple[]? requested_teams?;
    record  { string label; string ref; record  { string archive_url; string assignees_url; string blobs_url; string branches_url; string collaborators_url; string comments_url; string commits_url; string compare_url; string contents_url; string contributors_url; string deployments_url; string? description; string downloads_url; string events_url; boolean 'fork; string forks_url; string full_name; string git_commits_url; string git_refs_url; string git_tags_url; string hooks_url; string html_url; int id; string node_id; string issue_comment_url; string issue_events_url; string issues_url; string keys_url; string labels_url; string languages_url; string merges_url; string milestones_url; string name; string notifications_url; record  { string avatar_url; string events_url; string followers_url; string following_url; string gists_url; string? gravatar_id; string html_url; int id; string node_id; string login; string organizations_url; string received_events_url; string repos_url; boolean site_admin; string starred_url; string subscriptions_url; string 'type; string url;}  owner; boolean 'private; string pulls_url; string releases_url; string stargazers_url; string statuses_url; string subscribers_url; string subscription_url; string tags_url; string teams_url; string trees_url; string url; string clone_url; string default_branch; int forks; int forks_count; string git_url; boolean has_downloads; boolean has_issues; boolean has_projects; boolean has_wiki; boolean has_pages; string? homepage; string? language; string master_branch?; boolean archived; boolean disabled; string? mirror_url; int open_issues; int open_issues_count; record  { boolean admin; boolean pull; boolean push;}  permissions?; string temp_clone_token?; boolean allow_merge_commit?; boolean allow_squash_merge?; boolean allow_rebase_merge?; record  { string 'key; string name; string? url; string? spdx_id; string node_id;}  license; string pushed_at; int size; string ssh_url; int stargazers_count; string svn_url; string[] topics?; int watchers; int watchers_count; string created_at; string updated_at;}  repo; string sha; record  { string avatar_url; string events_url; string followers_url; string following_url; string gists_url; string? gravatar_id; string html_url; int id; string node_id; string login; string organizations_url; string received_events_url; string repos_url; boolean site_admin; string starred_url; string subscriptions_url; string 'type; string url;}  user;}  head;
    record  { string label; string ref; record  { string archive_url; string assignees_url; string blobs_url; string branches_url; string collaborators_url; string comments_url; string commits_url; string compare_url; string contents_url; string contributors_url; string deployments_url; string? description; string downloads_url; string events_url; boolean 'fork; string forks_url; string full_name; string git_commits_url; string git_refs_url; string git_tags_url; string hooks_url; string html_url; int id; string node_id; string issue_comment_url; string issue_events_url; string issues_url; string keys_url; string labels_url; string languages_url; string merges_url; string milestones_url; string name; string notifications_url; record  { string avatar_url; string events_url; string followers_url; string following_url; string gists_url; string? gravatar_id; string html_url; int id; string node_id; string login; string organizations_url; string received_events_url; string repos_url; boolean site_admin; string starred_url; string subscriptions_url; string 'type; string url;}  owner; boolean 'private; string pulls_url; string releases_url; string stargazers_url; string statuses_url; string subscribers_url; string subscription_url; string tags_url; string teams_url; string trees_url; string url; string clone_url; string default_branch; int forks; int forks_count; string git_url; boolean has_downloads; boolean has_issues; boolean has_projects; boolean has_wiki; boolean has_pages; string? homepage; string? language; string master_branch?; boolean archived; boolean disabled; string? mirror_url; int open_issues; int open_issues_count; record  { boolean admin; boolean pull; boolean push;}  permissions?; string temp_clone_token?; boolean allow_merge_commit?; boolean allow_squash_merge?; boolean allow_rebase_merge?; license-simple license; string pushed_at; int size; string ssh_url; int stargazers_count; string svn_url; string[] topics?; int watchers; int watchers_count; string created_at; string updated_at;}  repo; string sha; record  { string avatar_url; string events_url; string followers_url; string following_url; string gists_url; string? gravatar_id; string html_url; int id; string node_id; string login; string organizations_url; string received_events_url; string repos_url; boolean site_admin; string starred_url; string subscriptions_url; string 'type; string url;}  user;}  base;
    record  { # Hypermedia Link
        Link comments; # Hypermedia Link
        Link commits; # Hypermedia Link
        Link statuses; # Hypermedia Link
        Link html; # Hypermedia Link
        Link issue; # Hypermedia Link
        Link review_comments; # Hypermedia Link
        Link review_comment; # Hypermedia Link
        Link self;}  _links;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    # The status of auto merging a pull request.
    AutoMerge? auto_merge;
    # Indicates whether or not the pull request is a draft.
    boolean draft?;
    boolean merged;
    boolean? mergeable;
    boolean? rebaseable?;
    string mergeable_state;
    simple-user merged_by;
    int comments;
    int review_comments;
    # Indicates whether maintainers can modify the pull request.
    boolean maintainer_can_modify;
    int commits;
    int additions;
    int deletions;
    int changed_files;
};

# License
public type License record {
    string 'key;
    string name;
    string? spdx_id;
    string? url;
    string node_id;
    string html_url;
    string description;
    string implementation;
    string[] permissions;
    string[] conditions;
    string[] limitations;
    string body;
    boolean featured;
};

# Demilestoned Issue Event
public type DemilestonedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { string title;}  milestone;
};

# Metaproperties for Git author/committer information.
public type GitUser record {
    string name?;
    string email?;
    string date?;
};

# Identifies the variable values associated with the environment in which this analysis was performed.
#
public type CodeScanningAnalysisEnvironment string;

public type CodeScanningSarifsReceipt record {
    # An identifier for the upload.
    CodeScanningAnalysisSarifId id?;
    # The REST API URL for checking the status of the upload.
    string url?;
};

# Milestoned Issue Event
public type MilestonedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { string title;}  milestone;
};

public type PagesHttpsCertificate record {
    string state;
    string description;
    # Array of the domain set and its alternate name (if it is configured)
    string[] domains;
    string expires_at?;
};

# Branch Restriction Policy
public type BranchRestrictionPolicy record {
    string url;
    string users_url;
    string teams_url;
    string apps_url;
    record  { string login?; int id?; string node_id?; string avatar_url?; string gravatar_id?; string url?; string html_url?; string followers_url?; string following_url?; string gists_url?; string starred_url?; string subscriptions_url?; string organizations_url?; string repos_url?; string events_url?; string received_events_url?; string 'type?; boolean site_admin?;} [] users;
    record  { int id?; string node_id?; string url?; string html_url?; string name?; string slug?; string? description?; string privacy?; string permission?; string members_url?; string repositories_url?; string? parent?;} [] teams;
    record  { int id?; string slug?; string node_id?; record  { string login?; int id?; string node_id?; string url?; string repos_url?; string events_url?; string hooks_url?; string issues_url?; string members_url?; string public_members_url?; string avatar_url?; string description?; string gravatar_id?; string html_url?; string followers_url?; string following_url?; string gists_url?; string starred_url?; string subscriptions_url?; string organizations_url?; string received_events_url?; string 'type?; boolean site_admin?;}  owner?; string name?; string description?; string external_url?; string html_url?; string created_at?; string updated_at?; record  { string metadata?; string contents?; string issues?; string single_file?;}  permissions?; string[] events?;} [] apps;
};

# License Simple
public type LicenseSimple record {
    string 'key;
    string name;
    string? url;
    string? spdx_id;
    string node_id;
    string html_url?;
};

public type ReactionRollup record {
    string url;
    int total_count;
    int '\+\1;
    int '\-\1;
    int laugh;
    int confused;
    int heart;
    int hooray;
    int eyes;
    int rocket;
};

# SCIM /Users provisioning endpoints
public type ScimUser record {
    # SCIM schema used.
    string[] schemas;
    # Unique identifier of an external identity
    string id;
    # The ID of the User.
    string? externalId;
    # Configured by the admin. Could be an email, login, or username
    string? userName;
    # The name of the user, suitable for display to end-users
    string? displayName?;
    record  { string? givenName; string? familyName; string? formatted?;}  name;
    # user emails
    record  { string value; boolean primary?;} [] emails;
    # The active status of the User.
    boolean active;
    record  { string resourceType?; string created?; string lastModified?; string location?;}  meta;
    # The ID of the organization.
    int organization_id?;
    # Set of operations to be performed
    record  { string op; string path?; string|record {}|[] value?;} [] operations?;
    # associated groups
    anydata[] groups?;
};

# Private User
public type PrivateUser record {
    string login;
    int id;
    string node_id;
    string avatar_url;
    string? gravatar_id;
    string url;
    string html_url;
    string followers_url;
    string following_url;
    string gists_url;
    string starred_url;
    string subscriptions_url;
    string organizations_url;
    string repos_url;
    string events_url;
    string received_events_url;
    string 'type;
    boolean site_admin;
    string? name;
    string? company;
    string? blog;
    string? location;
    string? email;
    boolean? hireable;
    string? bio;
    string? twitter_username?;
    int public_repos;
    int public_gists;
    int followers;
    int following;
    string created_at;
    string updated_at;
    int private_gists;
    int total_private_repos;
    int owned_private_repos;
    int disk_usage;
    int collaborators;
    boolean two_factor_authentication;
    record  { int collaborators; string name; int space; int private_repos;}  plan?;
    string? suspended_at?;
    boolean business_plus?;
    string ldap_dn?;
};

# Hypermedia Link with Type
public type LinkWithType record {
    string href;
    string 'type;
};

# The time that the analysis was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
#
public type CodeScanningAnalysisCreatedAt string;

public type CombinedBillingUsage record {
    # Numbers of days left in billing cycle.
    int days_left_in_billing_cycle;
    # Estimated storage space (GB) used in billing cycle.
    int estimated_paid_storage_for_month;
    # Estimated sum of free and paid storage space (GB) used in billing cycle.
    int estimated_storage_for_month;
};

# Team Membership
public type TeamMembership record {
    string url;
    # The role of the user in the team.
    string role;
    # The state of the user's membership in the team.
    string state;
};

# An object describing a symlink
public type ContentSymlink record {
    string 'type;
    string target;
    int size;
    string name;
    string path;
    string sha;
    string url;
    string? git_url;
    string? html_url;
    string? download_url;
    record  { string? git; string? html; string self;}  _links;
};

# The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
#
public type WebhookConfigContentType string;

public type SearchResultTextMatches record { stringobject_url?;string?object_type?;stringproperty?;stringfragment?;record { stringtext?;int[]indices?;} []matches?;}[];

public type ScopedInstallation record {
    # The permissions granted to the user-to-server access token.
    AppPermissions permissions;
    # Describe whether all repositories have been selected or there's a selection involved
    string repository_selection;
    string? single_file_name;
    boolean has_multiple_single_files?;
    string[] single_file_paths?;
    string repositories_url;
    # Simple User
    SimpleUser? account;
};

# If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
#
public type WebhookConfigSecret string;

# Label Search Result Item
public type LabelSearchResultItem record {
    int id;
    string node_id;
    string url;
    string name;
    string color;
    boolean 'default;
    string? description;
    decimal score;
    SearchResultTextMatches text_matches?;
};

# Pull Request Simple
public type PullRequestSimple record {
    string url;
    int id;
    string node_id;
    string html_url;
    string diff_url;
    string patch_url;
    string issue_url;
    string commits_url;
    string review_comments_url;
    string review_comment_url;
    string comments_url;
    string statuses_url;
    int number;
    string state;
    boolean locked;
    string title;
    simple-user user;
    string? body;
    record  { int id?; string node_id?; string url?; string name?; string description?; string color?; boolean 'default?;} [] labels;
    milestone milestone;
    string? active_lock_reason?;
    string created_at;
    string updated_at;
    string? closed_at;
    string? merged_at;
    string? merge_commit_sha;
    simple-user assignee;
    SimpleUser[]? assignees?;
    SimpleUser[]? requested_reviewers?;
    Team[]? requested_teams?;
    record  { string label; string ref; # A git repository
        Repository repo; string sha; simple-user user;}  head;
    record  { string label; string ref; # A git repository
        Repository repo; string sha; simple-user user;}  base;
    record  { # Hypermedia Link
        Link comments; # Hypermedia Link
        Link commits; # Hypermedia Link
        Link statuses; # Hypermedia Link
        Link html; # Hypermedia Link
        Link issue; # Hypermedia Link
        Link review_comments; # Hypermedia Link
        Link review_comment; # Hypermedia Link
        Link self;}  _links;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    # The status of auto merging a pull request.
    AutoMerge? auto_merge;
    # Indicates whether or not the pull request is a draft.
    boolean draft?;
};

# Comments provide a way for people to collaborate on an issue.
public type IssueComment record {
    # Unique identifier of the issue comment
    int id;
    string node_id;
    # URL for the issue comment
    string url;
    # Contents of the issue comment
    string body?;
    string body_text?;
    string body_html?;
    string html_url;
    simple-user user;
    string created_at;
    string updated_at;
    string issue_url;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    integration performed_via_github_app?;
    ReactionRollup reactions?;
};

# A software package
public type Package record {
    # Unique identifier of the package.
    int id;
    # The name of the package.
    string name;
    string package_type;
    string url;
    string html_url;
    # The number of versions of the package.
    int version_count;
    string visibility;
    simple-user owner?;
    minimal-repository repository?;
    string created_at;
    string updated_at;
};

public type ScimGroupListEnterprise record {
    string[] schemas;
    decimal totalResults;
    decimal itemsPerPage;
    decimal startIndex;
    record  { string[] schemas; string id; string? externalId?; string displayName?; record  { string value?; string '\$ref?; string display?;} [] members?; record  { string resourceType?; string created?; string lastModified?; string location?;}  meta?;} [] Resources;
};

# A deployment created as the result of an Actions check run from a workflow that references an environment
public type DeploymentSimple record {
    string url;
    # Unique identifier of the deployment
    int id;
    string node_id;
    # Parameter to specify a task to execute
    string task;
    string original_environment?;
    # Name for the target deployment environment.
    string environment;
    string? description;
    string created_at;
    string updated_at;
    string statuses_url;
    string repository_url;
    # Specifies if the given environment is will no longer exist at some point in the future. Default: false.
    boolean transient_environment?;
    # Specifies if the given environment is one that end-users directly interact with. Default: false.
    boolean production_environment?;
    integration performed_via_github_app?;
};

# Content File
public type ContentFile record {
    string 'type;
    string encoding;
    int size;
    string name;
    string path;
    string content;
    string sha;
    string url;
    string? git_url;
    string? html_url;
    string? download_url;
    record  { string? git; string? html; string self;}  _links;
    string target?;
    string submodule_git_url?;
};

# Unassigned Issue Event
public type UnassignedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    # Simple User
    SimpleUser? assignee;
    # Simple User
    SimpleUser? assigner;
};

public type CodeScanningAlertRule record {
    # A unique identifier for the rule used to detect the alert.
    string? id?;
    # The name of the rule used to detect the alert.
    string name?;
    # The severity of the alert.
    string? severity?;
    # The security severity of the alert.
    string? security_severity_level?;
    # A short description of the rule used to detect the alert.
    string description?;
    # description of the rule used to detect the alert.
    string full_description?;
    # A set of tags applicable for the rule.
    string[]? tags?;
    # Detailed documentation for the rule as GitHub Flavored Markdown.
    string? help?;
};

public type PackagesBillingUsage record {
    # Sum of the free and paid storage space (GB) for GitHuub Packages.
    int total_gigabytes_bandwidth_used;
    # Total paid storage space (GB) for GitHuub Packages.
    int total_paid_gigabytes_bandwidth_used;
    # Free storage space (GB) for GitHub Packages.
    int included_gigabytes_bandwidth;
};

# Renamed Issue Event
public type RenamedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { string 'from; string to;}  rename;
};

# The authorization for an OAuth app, GitHub App, or a Personal Access Token.
public type Authorization record {
    int id;
    string url;
    # A list of scopes that this authorization is in.
    string[]? scopes;
    string token;
    string? token_last_eight;
    string? hashed_token;
    record  { string client_id; string name; string url;}  app;
    string? note;
    string? note_url;
    string updated_at;
    string created_at;
    string? fingerprint;
    simple-user user?;
    scoped-installation installation?;
};

# Whether GitHub Actions is enabled on the repository.
#
public type ActionsEnabled boolean;

# The REST API URL for fetching the list of instances for an alert.
#
public type AlertInstancesUrl string;

# Unlabeled Issue Event
public type UnlabeledIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { string name; string color;}  label;
};

# Pull Request Review Request
public type PullRequestReviewRequest record {
    SimpleUser[] users;
    Team[] teams;
};

# State of a code scanning alert.
#
public type CodeScanningAlertState string;

# Sets the state of the code scanning alert. Can be one of `open` or `dismissed`. You must provide `dismissed_reason` when you set the state to `dismissed`.
#
public type CodeScanningAlertSetState string;

public type CodeScanningAnalysis record {
    # The full Git reference, formatted as `refs/heads/<branch name>`,
    CodeScanningRef ref;
    # The SHA of the commit to which the analysis you are uploading relates.
    CodeScanningAnalysisCommitSha commit_sha;
    # Identifies the configuration under which the analysis was executed. For example, in GitHub Actions this includes the workflow filename and job name.
    CodeScanningAnalysisAnalysisKey analysis_key;
    # Identifies the variable values associated with the environment in which this analysis was performed.
    CodeScanningAnalysisEnvironment environment;
    # Identifies the configuration under which the analysis was executed. Used to distinguish between multiple analyses for the same tool and commit, but performed on different languages or different parts of the code.
    CodeScanningAnalysisCategory category?;
    string _error;
    # The time that the analysis was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    CodeScanningAnalysisCreatedAt created_at;
    # The total number of results in the analysis.
    int results_count;
    # The total number of rules used in the analysis.
    int rules_count;
    # Unique identifier for this analysis.
    int id;
    # The REST API URL of the analysis resource.
    CodeScanningAnalysisUrl url;
    # An identifier for the upload.
    CodeScanningAnalysisSarifId sarif_id;
    CodeScanningAnalysisTool tool;
    boolean deletable;
    # Warning generated when processing the analysis
    string warning;
    string tool_name?;
};

# Webhooks for repositories.
public type Hook record {
    string 'type;
    # Unique identifier of the webhook.
    int id;
    # The name of a valid service, use 'web' for a webhook.
    string name;
    # Determines whether the hook is actually triggered on pushes.
    boolean active;
    # Determines what events the hook is triggered for. Default: ['push'].
    string[] events;
    record  { string email?; string password?; string room?; string subdomain?; # The URL to which the payloads will be delivered.
        WebhookConfigUrl url?; WebhookConfigInsecureSsl insecure_ssl?; # The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
        WebhookConfigContentType content_type?; string digest?; # If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
        WebhookConfigSecret secret?; string token?;}  config;
    string updated_at;
    string created_at;
    string url;
    string test_url;
    string ping_url;
    string deliveries_url?;
    HookResponse last_response;
};

# Installation
public type Installation record {
    # The ID of the installation.
    int id;
    simple-user|enterprise account;
    # Describe whether all repositories have been selected or there's a selection involved
    string repository_selection;
    string access_tokens_url;
    string repositories_url;
    string html_url;
    int app_id;
    # The ID of the user or organization this token is being scoped to.
    int target_id;
    string target_type;
    # The permissions granted to the user-to-server access token.
    AppPermissions permissions;
    string[] events;
    string created_at;
    string updated_at;
    string? single_file_name;
    boolean has_multiple_single_files?;
    string[] single_file_paths?;
    string app_slug;
    simple-user suspended_by;
    string? suspended_at;
    string? contact_email?;
};

# Runner Application
public type RunnerApplication record {
    string os;
    string architecture;
    string download_url;
    string filename;
    # A short lived bearer token used to download the runner, if needed.
    string temp_download_token?;
    string sha256_checksum?;
};

# Issue Event Milestone
public type IssueEventMilestone record {
    string title;
};

# Check suite configuration preferences for a repository.
public type CheckSuitePreference record {
    record  { record  { int app_id; boolean setting;} [] auto_trigger_checks?;}  preferences;
    # Minimal Repository
    MinimalRepository repository;
};

# Org Hook
public type OrgHook record {
    int id;
    string url;
    string ping_url;
    string deliveries_url?;
    string name;
    string[] events;
    boolean active;
    record  { string url?; string insecure_ssl?; string content_type?; string secret?;}  config;
    string updated_at;
    string created_at;
    string 'type;
};

# Limit interactions to a specific type of user for a specified duration
public type InteractionLimit record {
    # The type of GitHub user that can comment, open issues, or create pull requests while the interaction limit is in effect. Can be one of: `existing_users`, `contributors_only`, `collaborators_only`.
    InteractionGroup 'limit;
    # The duration of the interaction restriction. Can be one of: `one_day`, `three_days`, `one_week`, `one_month`, `six_months`. Default: `one_day`.
    InteractionExpiry expiry?;
};

public type Verification record {
    boolean verified;
    string reason;
    string? payload;
    string? signature;
};

# File Commit
public type FileCommit record {
    record  { string name?; string path?; string sha?; int size?; string url?; string html_url?; string git_url?; string download_url?; string 'type?; record  { string self?; string git?; string html?;}  _links?;}  content;
    record  { string sha?; string node_id?; string url?; string html_url?; record  { string date?; string name?; string email?;}  author?; record  { string date?; string name?; string email?;}  committer?; string message?; record  { string url?; string sha?;}  tree?; record  { string url?; string html_url?; string sha?;} [] parents?; record  { boolean verified?; string reason?; string? signature?; string? payload?;}  verification?;}  'commit;
};

# Review Request Removed Issue Event
public type ReviewRequestRemovedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    # Simple User
    SimpleUser? review_requester;
    # Groups of organization members that gives permissions on specified repositories.
    Team requested_team?;
    # Simple User
    SimpleUser? requested_reviewer?;
};

# An artifact
public type Artifact record {
    int id;
    string node_id;
    # The name of the artifact.
    string name;
    # The size in bytes of the artifact.
    int size_in_bytes;
    string url;
    string archive_download_url;
    # Whether or not the artifact has expired.
    boolean expired;
    string? created_at;
    string? expires_at;
    string? updated_at;
};

# Thread
public type Thread record {
    string id;
    # Minimal Repository
    MinimalRepository repository;
    record  { string title; string url; string latest_comment_url; string 'type;}  subject;
    string reason;
    boolean unread;
    string updated_at;
    string? last_read_at;
    string url;
    string subscription_url;
};

# Authentication token for a GitHub App installed on a user or org.
public type InstallationToken record {
    string token;
    string expires_at;
    # The permissions granted to the user-to-server access token.
    AppPermissions permissions?;
    string repository_selection?;
    Repository[] repositories?;
    string single_file?;
    boolean has_multiple_single_files?;
    string[] single_file_paths?;
};

# The API URL to use to get or set the actions that are allowed to run, when `allowed_actions` is set to `selected`.
#
public type SelectedActionsUrl string;

# Describe a region within a file for the alert.
public type CodeScanningAlertLocation record {
    string path?;
    int start_line?;
    int end_line?;
    int start_column?;
    int end_column?;
};

# An object describing a symlink
public type ContentSubmodule record {
    string 'type;
    string submodule_git_url;
    int size;
    string name;
    string path;
    string sha;
    string url;
    string? git_url;
    string? html_url;
    string? download_url;
    record  { string? git; string? html; string self;}  _links;
};

# An enterprise account
public type Enterprise record {
    # A short description of the enterprise.
    string? description?;
    string html_url;
    # The enterprise's website URL.
    string? website_url?;
    # Unique identifier of the enterprise
    int id;
    string node_id;
    # The name of the enterprise.
    string name;
    # The slug url identifier for the enterprise.
    string slug;
    string? created_at;
    string? updated_at;
    string avatar_url;
};

# Tag
public type Tag record {
    string name;
    record  { string sha; string url;}  'commit;
    string zipball_url;
    string tarball_url;
    string node_id;
};

# The status of a deployment.
public type DeploymentStatus record {
    string url;
    int id;
    string node_id;
    # The state of the status.
    string state;
    simple-user creator;
    # A short description of the status.
    string description;
    # The environment of the deployment that the status is for.
    string environment?;
    # Deprecated: the URL to associate with this status.
    string target_url;
    string created_at;
    string updated_at;
    string deployment_url;
    string repository_url;
    # The URL for accessing your environment.
    string environment_url?;
    # The URL to associate with this status.
    string log_url?;
    integration performed_via_github_app?;
};

# Groups of organization members that gives permissions on specified repositories.
public type TeamSimple record {
    # Unique identifier of the team
    int id;
    string node_id;
    # URL for the team
    string url;
    string members_url;
    # Name of the team
    string name;
    # Description of the team
    string? description;
    # Permission that the team will have for its repositories
    string permission;
    # The level of privacy this team should have
    string privacy?;
    string html_url;
    string repositories_url;
    string slug;
    # Distinguished Name (DN) that team maps to within LDAP environment
    string ldap_dn?;
};

# Secrets for GitHub Actions for an organization.
public type OrganizationActionsSecret record {
    # The name of the secret.
    string name;
    string created_at;
    string updated_at;
    # Visibility of a secret
    string visibility;
    string selected_repositories_url?;
};

# The name of the tool used to generate the code scanning analysis.
#
public type CodeScanningAnalysisToolName string;

# Timeline Committed Event
public type TimelineCommittedEvent record {
    string event?;
    # SHA for the commit
    string sha;
    string node_id;
    string url;
    # Identifying information for the git-user
    record  { # Timestamp of the commit
        string date; # Git email address of the user
        string email; # Name of the git user
        string name;}  author;
    # Identifying information for the git-user
    record  { # Timestamp of the commit
        string date; # Git email address of the user
        string email; # Name of the git user
        string name;}  committer;
    # Message describing the purpose of the commit
    string message;
    record  { # SHA for the commit
        string sha; string url;}  tree;
    record  { # SHA for the commit
        string sha; string url; string html_url;} [] parents;
    record  { boolean verified; string reason; string? signature; string? payload;}  verification;
    string html_url;
};

# Identifies the variable values associated with the environment in which the analysis that generated this alert instance was performed, such as the language that was analyzed.
#
public type CodeScanningAlertEnvironment string;

# The GUID of the tool used to generate the code scanning analysis, if provided in the uploaded SARIF data.
#
public type CodeScanningAnalysisToolGuid string;

public type HookResponse record {
    int? code;
    string? status;
    string? message;
};

# Delivery made by a webhook, without request and response information.
public type HookDeliveryItem record {
    # Unique identifier of the webhook delivery.
    int id;
    # Unique identifier for the event (shared with all deliveries for all webhooks that subscribe to this event).
    string guid;
    # Time when the webhook delivery occurred.
    string delivered_at;
    # Whether the webhook delivery is a redelivery.
    boolean redelivery;
    # Time spent delivering.
    decimal duration;
    # Describes the response returned after attempting the delivery.
    string status;
    # Status code received when delivery was made.
    int status_code;
    # The event that triggered the delivery.
    string event;
    # The type of activity for the event that triggered the delivery.
    string? action;
    # The id of the GitHub App installation associated with this event.
    int? installation_id;
    # The id of the repository associated with this event.
    int? repository_id;
};

# External Groups to be mapped to a team for membership
public type GroupMapping record {
    # Array of groups to be mapped to this team
    record  { # The ID of the group
        string group_id; # The name of the group
        string group_name; # a description of the group
        string group_description; # synchronization status for this group mapping
        string status?; # the time of the last sync for this group-mapping
        string? synced_at?;} [] groups?;
};

# Stargazer
public type Stargazer record {
    string starred_at;
    simple-user user;
};

# **Required when the state is dismissed.** The reason for dismissing or closing the alert. Can be one of: `false positive`, `won't fix`, and `used in tests`.
#
public type CodeScanningAlertDismissedReason string;

# The URL to which the payloads will be delivered.
#
public type WebhookConfigUrl string;

public type RunnerGroupsEnterprise record {
    decimal id;
    string name;
    string visibility;
    boolean 'default;
    string selected_organizations_url?;
    string runners_url;
    boolean allows_public_repositories;
};

# Pages Health Check Status
public type PagesHealthCheck record {
    record  { string host?; string uri?; string nameservers?; boolean dns_resolves?; boolean? is_proxied?; boolean? is_cloudflare_ip?; boolean? is_fastly_ip?; boolean? is_old_ip_address?; boolean? is_a_record?; boolean? has_cname_record?; boolean? has_mx_records_present?; boolean is_valid_domain?; boolean is_apex_domain?; boolean? should_be_a_record?; boolean? is_cname_to_github_user_domain?; boolean? is_cname_to_pages_dot_github_dot_com?; boolean? is_cname_to_fastly?; boolean? is_pointed_to_github_pages_ip?; boolean? is_non_github_pages_ip_present?; boolean is_pages_domain?; boolean? is_served_by_pages?; boolean is_valid?; string? reason?; boolean responds_to_https?; boolean enforces_https?; string? https_error?; boolean? is_https_eligible?; string? caa_error?;}  domain?;
    record  { string host?; string uri?; string nameservers?; boolean dns_resolves?; boolean? is_proxied?; boolean? is_cloudflare_ip?; boolean? is_fastly_ip?; boolean? is_old_ip_address?; boolean? is_a_record?; boolean? has_cname_record?; boolean? has_mx_records_present?; boolean is_valid_domain?; boolean is_apex_domain?; boolean? should_be_a_record?; boolean? is_cname_to_github_user_domain?; boolean? is_cname_to_pages_dot_github_dot_com?; boolean? is_cname_to_fastly?; boolean? is_pointed_to_github_pages_ip?; boolean? is_non_github_pages_ip_present?; boolean is_pages_domain?; boolean? is_served_by_pages?; boolean is_valid?; string? reason?; boolean responds_to_https?; boolean enforces_https?; string? https_error?; boolean? is_https_eligible?; string? caa_error?;}  alt_domain?;
};

# Check Annotation
public type CheckAnnotation record {
    string path;
    int start_line;
    int end_line;
    int? start_column;
    int? end_column;
    string? annotation_level;
    string? title;
    string? message;
    string? raw_details;
    string blob_href;
};

# The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
#
public type AllowedActions string;

# A team discussion is a persistent record of a free-form conversation within a team.
public type TeamDiscussion record {
    simple-user author;
    # The main text of the discussion.
    string body;
    string body_html;
    # The current version of the body content. If provided, this update operation will be rejected if the given version does not match the latest version on the server.
    string body_version;
    int comments_count;
    string comments_url;
    string created_at;
    string? last_edited_at;
    string html_url;
    string node_id;
    # The unique sequence number of a team discussion.
    int number;
    # Whether or not this discussion should be pinned for easy retrieval.
    boolean pinned;
    # Whether or not this discussion should be restricted to team members and organization administrators.
    boolean 'private;
    string team_url;
    # The title of the discussion.
    string title;
    string updated_at;
    string url;
    ReactionRollup reactions?;
};

# Information of a job execution in a workflow run
public type Job record {
    # The id of the job.
    int id;
    # The id of the associated workflow run.
    int run_id;
    string run_url;
    string node_id;
    # The SHA of the commit that is being run.
    string head_sha;
    string url;
    string? html_url;
    # The phase of the lifecycle that the job is currently in.
    string status;
    # The outcome of the job.
    string? conclusion;
    # The time that the job started, in ISO 8601 format.
    string started_at;
    # The time that the job finished, in ISO 8601 format.
    string? completed_at;
    # The name of the job.
    string name;
    # Steps in this job.
    record  { # The phase of the lifecycle that the job is currently in.
        string status; # The outcome of the job.
        string? conclusion; # The name of the job.
        string name; int number; # The time that the step started, in ISO 8601 format.
        string? started_at?; # The time that the job finished, in ISO 8601 format.
        string? completed_at?;} [] steps?;
    string check_run_url;
};

# Branch Protection
public type BranchProtection record {
    string url?;
    boolean enabled?;
    record  { string url?; string enforcement_level?; string[] contexts; string contexts_url?; boolean strict?;}  required_status_checks?;
    # Protected Branch Admin Enforced
    ProtectedBranchAdminEnforced enforce_admins?;
    # Protected Branch Pull Request Review
    ProtectedBranchPullRequestReview required_pull_request_reviews?;
    # Branch Restriction Policy
    BranchRestrictionPolicy restrictions?;
    record  { boolean enabled?;}  required_linear_history?;
    record  { boolean enabled?;}  allow_force_pushes?;
    record  { boolean enabled?;}  allow_deletions?;
    record  { boolean enabled?;}  required_conversation_resolution?;
    string name?;
    string protection_url?;
    record  { string url; boolean enabled;}  required_signatures?;
};

# Identifies the configuration under which the analysis was executed. Used to distinguish between multiple analyses for the same tool and commit, but performed on different languages or different parts of the code.
#
public type CodeScanningAnalysisCategory string;

# Feed
public type Feed record {
    string timeline_url;
    string user_url;
    string current_user_public_url?;
    string current_user_url?;
    string current_user_actor_url?;
    string current_user_organization_url?;
    string[] current_user_organization_urls?;
    string security_advisories_url?;
    record  { # Hypermedia Link with Type
        LinkWithType timeline; # Hypermedia Link with Type
        LinkWithType user; # Hypermedia Link with Type
        LinkWithType security_advisories?; # Hypermedia Link with Type
        LinkWithType current_user?; # Hypermedia Link with Type
        LinkWithType current_user_public?; # Hypermedia Link with Type
        LinkWithType current_user_actor?; # Hypermedia Link with Type
        LinkWithType current_user_organization?; LinkWithType[] current_user_organizations?;}  _links;
};

# Content Tree
public type ContentTree record {
    string 'type;
    int size;
    string name;
    string path;
    string sha;
    string url;
    string? git_url;
    string? html_url;
    string? download_url;
    record  { string 'type; int size; string name; string path; string content?; string sha; string url; string? git_url; string? html_url; string? download_url; record  { string? git; string? html; string self;}  _links;} [] entries?;
    record  { string? git; string? html; string self;}  _links;
};

# Commit Activity
public type CommitActivity record {
    int[] days;
    int total;
    int week;
};

# Public User
public type PublicUser record {
    string login;
    int id;
    string node_id;
    string avatar_url;
    string? gravatar_id;
    string url;
    string html_url;
    string followers_url;
    string following_url;
    string gists_url;
    string starred_url;
    string subscriptions_url;
    string organizations_url;
    string repos_url;
    string events_url;
    string received_events_url;
    string 'type;
    boolean site_admin;
    string? name;
    string? company;
    string? blog;
    string? location;
    string? email;
    boolean? hireable;
    string? bio;
    string? twitter_username?;
    int public_repos;
    int public_gists;
    int followers;
    int following;
    string created_at;
    string updated_at;
    record  { int collaborators; string name; int space; int private_repos;}  plan?;
    string? suspended_at?;
    int private_gists?;
    int total_private_repos?;
    int owned_private_repos?;
    int disk_usage?;
    int collaborators?;
};

# Blob
public type Blob record {
    string content;
    string encoding;
    string url;
    string sha;
    int? size;
    string node_id;
    string highlighted_content?;
};

# Timeline Unassigned Issue Event
public type TimelineUnassignedIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    # Simple User
    SimpleUser? assignee;
};

# Validation Error Simple
public type ValidationErrorSimple record {
    string message;
    string documentation_url;
    string[] errors?;
};

# Metadata for a Git tag
public type GitTag record {
    string node_id;
    # Name of the tag
    string tag;
    string sha;
    # URL for the tag
    string url;
    # Message describing the purpose of the tag
    string message;
    record  { string date; string email; string name;}  tagger;
    record  { string sha; string 'type; string url;}  'object;
    Verification verification?;
};

# An invocation of a workflow
public type WorkflowRun record {
    # The ID of the workflow run.
    int id;
    # The name of the workflow run.
    string? name?;
    string node_id;
    # The ID of the associated check suite.
    int check_suite_id?;
    # The node ID of the associated check suite.
    string check_suite_node_id?;
    string? head_branch;
    # The SHA of the head commit that points to the version of the worflow being run.
    string head_sha;
    # The auto incrementing run number for the workflow run.
    int run_number;
    string event;
    string? status;
    string? conclusion;
    # The ID of the parent workflow.
    int workflow_id;
    # The URL to the workflow run.
    string url;
    string html_url;
    PullRequestMinimal[]? pull_requests;
    string created_at;
    string updated_at;
    # The URL to the jobs for the workflow run.
    string jobs_url;
    # The URL to download the logs for the workflow run.
    string logs_url;
    # The URL to the associated check suite.
    string check_suite_url;
    # The URL to the artifacts for the workflow run.
    string artifacts_url;
    # The URL to cancel the workflow run.
    string cancel_url;
    # The URL to rerun the workflow run.
    string rerun_url;
    # The URL to the workflow.
    string workflow_url;
    simple-commit head_commit;
    # Minimal Repository
    MinimalRepository repository;
    # Minimal Repository
    MinimalRepository head_repository;
    int head_repository_id?;
};

# The authorization associated with an OAuth Access.
public type ApplicationGrant record {
    int id;
    string url;
    record  { string client_id; string name; string url;}  app;
    string created_at;
    string updated_at;
    string[] scopes;
    simple-user user?;
};

# Identifies the configuration under which the analysis was executed. For example, in GitHub Actions this includes the workflow filename and job name.
#
public type CodeScanningAnalysisAnalysisKey string;

# A suite of checks performed on the code of a given code change
public type CheckSuite record {
    int id;
    string node_id;
    string? head_branch;
    # The SHA of the head commit that is being checked.
    string head_sha;
    string? status;
    string? conclusion;
    string? url;
    string? before;
    string? after;
    PullRequestMinimal[]? pull_requests;
    integration app;
    # Minimal Repository
    MinimalRepository repository;
    string? created_at;
    string? updated_at;
    # Simple Commit
    SimpleCommit head_commit;
    int latest_check_runs_count;
    string check_runs_url;
};

# Data related to a release.
public type ReleaseAsset record {
    string url;
    string browser_download_url;
    int id;
    string node_id;
    # The file name of the asset.
    string name;
    string? label;
    # State of the release asset.
    string state;
    string content_type;
    int size;
    int download_count;
    string created_at;
    string updated_at;
    simple-user uploader;
};

# Organization Simple
public type OrganizationSimple record {
    string login;
    int id;
    string node_id;
    string url;
    string repos_url;
    string events_url;
    string hooks_url;
    string issues_url;
    string members_url;
    string public_members_url;
    string avatar_url;
    string? description;
};

# How the author is associated with the repository.
#
public type AuthorAssociation string;

# Details of a deployment environment
public type Environment record {
    # The id of the environment.
    int id;
    string node_id;
    # The name of the environment.
    string name;
    string url;
    string html_url;
    # The time that the environment was created, in ISO 8601 format.
    string created_at;
    # The time that the environment was last updated, in ISO 8601 format.
    string updated_at;
    anydata[] protection_rules?;
    # The type of deployment branch policy for this environment. To allow all branches to deploy, set to `null`.
    DeploymentBranchPolicy? deployment_branch_policy?;
};

public type PullRequestMinimal record {
    int id;
    int number;
    string url;
    record  { string ref; string sha; record  { int id; string url; string name;}  repo;}  head;
    record  { string ref; string sha; record  { int id; string url; string name;}  repo;}  base;
};

# Simple Commit
public type SimpleCommit record {
    string id;
    string tree_id;
    string message;
    string timestamp;
    record  { string name; string email;}  author;
    record  { string name; string email;}  committer;
};

# The public key used for setting Actions Secrets.
public type ActionsPublicKey record {
    # The identifier for the key.
    string key_id;
    # The Base64 encoded public key.
    string 'key;
    int id?;
    string url?;
    string title?;
    string created_at?;
};

# A self hosted runner
public type Runner record {
    # The id of the runner.
    int id;
    # The name of the runner.
    string name;
    # The Operating System of the runner.
    string os;
    # The status of the runner.
    string status;
    boolean busy;
    record  { # Unique identifier of the label.
        int id?; # Name of the label.
        string name?; # The type of label. Read-only labels are applied automatically when the runner is configured.
        string 'type?;} [] labels;
};

# Referrer Traffic
public type ReferrerTraffic record {
    string referrer;
    int count;
    int uniques;
};

# Simple User
public type SimpleUser record {
    string? name?;
    string? email?;
    string login;
    int id;
    string node_id;
    string avatar_url;
    string? gravatar_id;
    string url;
    string html_url;
    string followers_url;
    string following_url;
    string gists_url;
    string starred_url;
    string subscriptions_url;
    string organizations_url;
    string repos_url;
    string events_url;
    string received_events_url;
    string 'type;
    boolean site_admin;
    string starred_at?;
};

# Pull Request Reviews are reviews on pull requests.
public type PullRequestReview record {
    # Unique identifier of the review
    int id;
    string node_id;
    simple-user user;
    # The text of the review.
    string body;
    string state;
    string html_url;
    string pull_request_url;
    record  { record  { string href;}  html; record  { string href;}  pull_request;}  _links;
    string submitted_at?;
    # A commit SHA for the review.
    string commit_id;
    string body_html?;
    string body_text?;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
};

# The security alert number.
#
public type AlertNumber int;

# Org Membership
public type OrgMembership record {
    string url;
    # The state of the member in the organization. The `pending` state indicates the user has not yet accepted an invitation.
    string state;
    # The user's membership type in the organization.
    string role;
    string organization_url;
    # Organization Simple
    OrganizationSimple organization;
    simple-user user;
    record  { boolean can_create_repository;}  permissions?;
};

# A comment made to a gist.
public type GistComment record {
    int id;
    string node_id;
    string url;
    # The comment text.
    string body;
    simple-user user;
    string created_at;
    string updated_at;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
};

# Workflow Run Usage
public type WorkflowRunUsage record {
    record  { record  { int total_ms; int jobs;}  UBUNTU?; record  { int total_ms; int jobs;}  MACOS?; record  { int total_ms; int jobs;}  WINDOWS?;}  billable;
    int run_duration_ms?;
};

# Added to Project Issue Event
public type AddedToProjectIssueEvent record {
    int id;
    string node_id;
    string url;
    # Simple User
    SimpleUser? actor;
    string event;
    string? commit_id;
    string? commit_url;
    string created_at;
    # GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    Integration? performed_via_github_app;
    record  { int id; string url; int project_id; string project_url; string column_name; string previous_column_name?;}  project_card?;
};

public type RateLimit record {
    int 'limit;
    int remaining;
    int reset;
    int used;
};

public type  WebhookConfigInsecureSsl string|decimal;

# Pull Request Merge Result
public type PullRequestMergeResult record {
    string sha;
    boolean merged;
    string message;
};

# The REST API URL of the analysis resource.
#
public type CodeScanningAnalysisUrl string;

# Thread Subscription
public type ThreadSubscription record {
    boolean subscribed;
    boolean ignored;
    string? reason;
    string? created_at;
    string url;
    string thread_url?;
    string repository_url?;
};

# The version of the tool used to generate the code scanning analysis.
#
public type CodeScanningAnalysisToolVersion string;

# A topic aggregates entities that are related to a subject.
public type Topic record {
    string[] names;
};

# A release.
public type Release record {
    string url;
    string html_url;
    string assets_url;
    string upload_url;
    string? tarball_url;
    string? zipball_url;
    int id;
    string node_id;
    # The name of the tag.
    string tag_name;
    # Specifies the commitish value that determines where the Git tag is created from.
    string target_commitish;
    string? name;
    string? body?;
    # true to create a draft (unpublished) release, false to create a published one.
    boolean draft;
    # Whether to identify the release as a prerelease or a full release.
    boolean prerelease;
    string created_at;
    string? published_at;
    # Simple User
    SimpleUser? author;
    ReleaseAsset[] assets;
    string body_html?;
    string body_text?;
    # The URL of the release discussion.
    string discussion_url?;
    ReactionRollup reactions?;
};

# The hierarchy between files in a Git repository.
public type GitTree record {
    string sha;
    string url;
    boolean truncated;
    # Objects specifying a tree structure
    record  { string path?; string mode?; string 'type?; string sha?; int size?; string url?;} [] tree;
};

# GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
public type Integration record {
    # Unique identifier of the GitHub app
    int id;
    # The slug name of the GitHub app
    string slug?;
    string node_id;
    simple-user owner;
    # The name of the GitHub app
    string name;
    string? description;
    string external_url;
    string html_url;
    string created_at;
    string updated_at;
    # The set of permissions for the GitHub app
    record  { string issues?; string checks?; string metadata?; string contents?; string deployments?;}  permissions;
    # The list of events for the GitHub app
    string[] events;
    # The number of installations associated with the GitHub app
    int installations_count?;
    string client_id?;
    string client_secret?;
    string? webhook_secret?;
    string pem?;
};

# Commit Comment
public type CommitComment record {
    string html_url;
    string url;
    int id;
    string node_id;
    string body;
    string? path;
    int? position;
    int? line;
    string commit_id;
    simple-user user;
    string created_at;
    string updated_at;
    # How the author is associated with the repository.
    AuthorAssociation author_association;
    ReactionRollup reactions?;
};

# Contributor Activity
public type ContributorActivity record {
    simple-user author;
    int total;
    record  { int w?; int a?; int d?; int c?;} [] weeks;
};

# Content Reference attachments allow you to provide context around URLs posted in comments
public type ContentReferenceAttachment record {
    # The ID of the attachment
    int id;
    # The title of the attachment
    string title;
    # The body of the attachment
    string body;
    # The node_id of the content attachment
    string node_id?;
};

# Issue Event Label
public type IssueEventLabel record {
    string? name;
    string? color;
};

# Protected Branch Pull Request Review
public type ProtectedBranchPullRequestReview record {
    string url?;
    record  { # The list of users with review dismissal access.
        SimpleUser[] users?; # The list of teams with review dismissal access.
        Team[] teams?; string url?; string users_url?; string teams_url?;}  dismissal_restrictions?;
    boolean dismiss_stale_reviews;
    boolean require_code_owner_reviews;
    int required_approving_review_count?;
};

# Branch protections protect branches
public type ProtectedBranch record {
    string url;
    # Status Check Policy
    StatusCheckPolicy required_status_checks?;
    record  { string url; boolean dismiss_stale_reviews?; boolean require_code_owner_reviews?; int required_approving_review_count?; record  { string url; string users_url; string teams_url; SimpleUser[] users; Team[] teams;}  dismissal_restrictions?;}  required_pull_request_reviews?;
    record  { string url; boolean enabled;}  required_signatures?;
    record  { string url; boolean enabled;}  enforce_admins?;
    record  { boolean enabled;}  required_linear_history?;
    record  { boolean enabled;}  allow_force_pushes?;
    record  { boolean enabled;}  allow_deletions?;
    # Branch Restriction Policy
    BranchRestrictionPolicy restrictions?;
    record  { boolean enabled?;}  required_conversation_resolution?;
};

# Commit
public type Commit record {
    string url;
    string sha;
    string node_id;
    string html_url;
    string comments_url;
    record  { string url; git-user author; git-user committer; string message; int comment_count; record  { string sha; string url;}  tree; Verification verification?;}  'commit;
    simple-user author;
    simple-user committer;
    record  { string sha; string url; string html_url?;} [] parents;
    record  { int additions?; int deletions?; int total?;}  stats?;
    record  { string filename?; int additions?; int deletions?; int changes?; string status?; string raw_url?; string blob_url?; string patch?; string sha?; string contents_url?; string previous_filename?;} [] files?;
};

public type CodeScanningAnalysisTool record {
    # The name of the tool used to generate the code scanning analysis.
    CodeScanningAnalysisToolName name?;
    # The version of the tool used to generate the code scanning analysis.
    CodeScanningAnalysisToolVersion? 'version?;
    # The GUID of the tool used to generate the code scanning analysis, if provided in the uploaded SARIF data.
    CodeScanningAnalysisToolGuid? guid?;
};

# Community Profile
public type CommunityProfile record {
    int health_percentage;
    string? description;
    string? documentation;
    record  { code-of-conduct-simple code_of_conduct; community-health-file code_of_conduct_file; license-simple license; community-health-file contributing; community-health-file readme; community-health-file issue_template; community-health-file pull_request_template;}  files;
    string? updated_at;
    boolean content_reports_enabled?;
};

# A check performed on the code of a given code change
public type CheckRun record {
    # The id of the check.
    int id;
    # The SHA of the commit that is being checked.
    string head_sha;
    string node_id;
    string? external_id;
    string url;
    string? html_url;
    string? details_url;
    # The phase of the lifecycle that the check is currently in.
    string status;
    string? conclusion;
    string? started_at;
    string? completed_at;
    record  { string? title; string? summary; string? text; int annotations_count; string annotations_url;}  output;
    # The name of the check.
    string name;
    record  { int id;}  check_suite;
    integration app;
    PullRequestMinimal[] pull_requests;
    # A deployment created as the result of an Actions check run from a workflow that references an environment
    DeploymentSimple deployment?;
};

# Porter Large File
public type PorterLargeFile record {
    string ref_name;
    string path;
    string oid;
    int size;
};

# Timeline Commit Commented Event
public type TimelineCommitCommentedEvent record {
    string event?;
    string node_id?;
    string commit_id?;
    CommitComment[] comments?;
};

public type CodeScanningAlertItems record {
    # The security alert number.
    AlertNumber number;
    # The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    AlertCreatedAt created_at;
    # The REST API URL of the alert resource.
    AlertUrl url;
    # The GitHub URL of the alert resource.
    AlertHtmlUrl html_url;
    # The REST API URL for fetching the list of instances for an alert.
    AlertInstancesUrl instances_url;
    # State of a code scanning alert.
    CodeScanningAlertState state;
    # Simple User
    SimpleUser? dismissed_by;
    # The time that the alert was dismissed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    CodeScanningAlertDismissedAt? dismissed_at;
    # **Required when the state is dismissed.** The reason for dismissing or closing the alert. Can be one of: `false positive`, `won't fix`, and `used in tests`.
    CodeScanningAlertDismissedReason? dismissed_reason;
    CodeScanningAlertRuleSummary rule;
    CodeScanningAnalysisTool tool;
    CodeScanningAlertInstance most_recent_instance;
};
