import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type SimpleUserArr SimpleUser[];

public type IssueSimpleArr IssueSimple[];

public type IssuesCreateRequest record {
    # The title of the issue.
    string|int title;
    # The contents of the issue.
    string body?;
    # Login for the user that this issue should be assigned to. _NOTE: Only users with push access can set the assignee for new issues. The assignee is silently dropped otherwise. **This field is deprecated.**_
    string? assignee?;
    string|int milestone?;
    # Labels to associate with this issue. _NOTE: Only users with push access can set labels for new issues. Labels are silently dropped otherwise._
    anydata[] labels?;
    # Logins for Users to assign to this issue. _NOTE: Only users with push access can set assignees for new issues. Assignees are silently dropped otherwise._
    string[] assignees?;
};

public type IssueCommentArr IssueComment[];

public type IssuesUpdateCommentRequest record {
    # The contents of the comment.
    string body;
};

public type IssueEventArr IssueEvent[];

public type IssuesUpdateRequest record {
    # The title of the issue.
    string|int title?;
    # The contents of the issue.
    string? body?;
    # Login for the user that this issue should be assigned to. **This field is deprecated.**
    string? assignee?;
    # State of the issue. Either `open` or `closed`.
    string state?;
    string|int milestone?;
    # Labels to associate with this issue. Pass one or more Labels to _replace_ the set of Labels on this Issue. Send an empty array (`[]`) to clear all Labels from the Issue. _NOTE: Only users with push access can set labels for issues. Labels are silently dropped otherwise._
    anydata[] labels?;
    # Logins for Users to assign to this issue. Pass one or more user logins to _replace_ the set of assignees on this Issue. Send an empty array (`[]`) to clear all assignees from the Issue. _NOTE: Only users with push access can set assignees for new issues. Assignees are silently dropped otherwise._
    string[] assignees?;
};

public type IssuesAddAssigneesRequest record {
    # Usernames of people to assign this issue to. _NOTE: Only users with push access can add assignees to an issue. Assignees are silently ignored otherwise._
    string[] assignees?;
};

public type IssuesRemoveAssigneesRequest record {
    # Usernames of assignees to remove from an issue. _NOTE: Only users with push access can remove assignees from an issue. Assignees are silently ignored otherwise._
    string[] assignees?;
};

public type IssuesCreateCommentRequest record {
    # The contents of the comment.
    string body;
};

public type IssueEventForIssueArr IssueEventForIssue[];

public type LabelArr Label[];

public type IssuesLockRequest record {
    # The reason for locking the issue or pull request conversation. Lock will fail if you don't use one of these reasons:  
    string lock_reason?;
};

public type TimelineIssueEventsArr TimelineIssueEvents[];

public type IssuesCreateLabelRequest record {
    # The name of the label. Emoji can be added to label names, using either native emoji or colon-style markup. For example, typing `:strawberry:` will render the emoji ![:strawberry:](https://github.githubassets.com/images/icons/emoji/unicode/1f353.png ":strawberry:"). For a full list of available emoji and codes, see "[Emoji cheat sheet](https://github.com/ikatyang/emoji-cheat-sheet)."
    string name;
    # The [hexadecimal color code](http://www.color-hex.com/) for the label, without the leading `#`.
    string color?;
    # A short description of the label.
    string description?;
};

public type IssuesUpdateLabelRequest record {
    # The new name of the label. Emoji can be added to label names, using either native emoji or colon-style markup. For example, typing `:strawberry:` will render the emoji ![:strawberry:](https://github.githubassets.com/images/icons/emoji/unicode/1f353.png ":strawberry:"). For a full list of available emoji and codes, see "[Emoji cheat sheet](https://github.com/ikatyang/emoji-cheat-sheet)."
    string new_name?;
    # The [hexadecimal color code](http://www.color-hex.com/) for the label, without the leading `#`.
    string color?;
    # A short description of the label.
    string description?;
};

public type MilestoneArr Milestone[];

public type IssuesCreateMilestoneRequest record {
    # The title of the milestone.
    string title;
    # The state of the milestone. Either `open` or `closed`.
    string state?;
    # A description of the milestone.
    string description?;
    # The milestone due date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    string due_on?;
};

public type IssuesUpdateMilestoneRequest record {
    # The title of the milestone.
    string title?;
    # The state of the milestone. Either `open` or `closed`.
    string state?;
    # A description of the milestone.
    string description?;
    # The milestone due date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    string due_on?;
};

public type IssueArr Issue[];

# GitHub's v3 REST API.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.github.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # List assignees
    #
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListAssignees(string owner, string repo, int? perPage = 30, int? page = 1) returns SimpleUserArr|error {
        string  path = string `/repos/${owner}/${repo}/assignees`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        SimpleUserArr response = check self.clientEp-> get(path, targetType = SimpleUserArr);
        return response;
    }
    # Check if a user can be assigned
    #
    # + return - If the `assignee` can be assigned to issues in the repository, a `204` header with no content is returned.
    remote isolated function issuesCheckUserCanBeAssigned(string owner, string repo, string assignee) returns error? {
        string  path = string `/repos/${owner}/${repo}/assignees/${assignee}`;
         _ = check self.clientEp-> get(path, targetType=http:Response);
    }
    # List repository issues
    #
    # + milestone - If an `integer` is passed, it should refer to a milestone by its `number` field. If the string `*` is passed, issues with any milestone are accepted. If the string `none` is passed, issues without milestones are returned.
    # + state - Indicates the state of the issues to return. Can be either `open`, `closed`, or `all`.
    # + assignee - Can be the name of a user. Pass in `none` for issues with no assigned user, and `*` for issues assigned to any user.
    # + creator - The user that created the issue.
    # + mentioned - A user that's mentioned in the issue.
    # + labels - A list of comma separated label names. Example: `bug,ui,@high`
    # + sort - What to sort results by. Can be either `created`, `updated`, `comments`.
    # + direction - One of `asc` (ascending) or `desc` (descending).
    # + since - Only show notifications updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListForRepo(string owner, string repo, string? milestone = (), string? state = "open", string? assignee = (), string? creator = (), string? mentioned = (), string? labels = (), string? sort = "created", string? direction = "desc", string? since = (), int? perPage = 30, int? page = 1) returns IssueSimpleArr|error {
        string  path = string `/repos/${owner}/${repo}/issues`;
        map<anydata> queryParam = {"milestone": milestone, "state": state, "assignee": assignee, "creator": creator, "mentioned": mentioned, "labels": labels, "sort": sort, "direction": direction, "since": since, "per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        IssueSimpleArr response = check self.clientEp-> get(path, targetType = IssueSimpleArr);
        return response;
    }
    # Create an issue
    #
    # + return - Response
    remote isolated function issuesCreate(string owner, string repo, IssuesCreateRequest payload) returns Issue|error {
        string  path = string `/repos/${owner}/${repo}/issues`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Issue response = check self.clientEp->post(path, request, targetType=Issue);
        return response;
    }
    # List issue comments for a repository
    #
    # + sort - One of `created` (when the repository was starred) or `updated` (when it was last pushed to).
    # + direction - Either `asc` or `desc`. Ignored without the `sort` parameter.
    # + since - Only show notifications updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListCommentsForRepo(string owner, string repo, string? sort = "created", string? direction = (), string? since = (), int? perPage = 30, int? page = 1) returns IssueCommentArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/comments`;
        map<anydata> queryParam = {"sort": sort, "direction": direction, "since": since, "per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        IssueCommentArr response = check self.clientEp-> get(path, targetType = IssueCommentArr);
        return response;
    }
    # Get an issue comment
    #
    # + comment_id - comment_id parameter
    # + return - Response
    remote isolated function issuesGetComment(string owner, string repo, int comment_id) returns IssueComment|error {
        string  path = string `/repos/${owner}/${repo}/issues/comments/${comment_id}`;
        IssueComment response = check self.clientEp-> get(path, targetType = IssueComment);
        return response;
    }
    # Delete an issue comment
    #
    # + comment_id - comment_id parameter
    # + return - Response
    remote isolated function issuesDeleteComment(string owner, string repo, int comment_id) returns error? {
        string  path = string `/repos/${owner}/${repo}/issues/comments/${comment_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Update an issue comment
    #
    # + comment_id - comment_id parameter
    # + return - Response
    remote isolated function issuesUpdateComment(string owner, string repo, int comment_id, IssuesUpdateCommentRequest payload) returns IssueComment|error {
        string  path = string `/repos/${owner}/${repo}/issues/comments/${comment_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueComment response = check self.clientEp->patch(path, request, targetType=IssueComment);
        return response;
    }
    # List issue events for a repository
    #
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListEventsForRepo(string owner, string repo, int? perPage = 30, int? page = 1) returns IssueEventArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/events`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        IssueEventArr response = check self.clientEp-> get(path, targetType = IssueEventArr);
        return response;
    }
    # Get an issue event
    #
    # + return - Response
    remote isolated function issuesGetEvent(string owner, string repo, int event_id) returns IssueEvent|error {
        string  path = string `/repos/${owner}/${repo}/issues/events/${event_id}`;
        IssueEvent response = check self.clientEp-> get(path, targetType = IssueEvent);
        return response;
    }
    # Get an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesGet(string owner, string repo, int issue_number) returns Issue|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}`;
        Issue response = check self.clientEp-> get(path, targetType = Issue);
        return response;
    }
    # Update an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesUpdate(string owner, string repo, int issue_number, IssuesUpdateRequest payload) returns Issue|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Issue response = check self.clientEp->patch(path, request, targetType=Issue);
        return response;
    }
    # Add assignees to an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesAddAssignees(string owner, string repo, int issue_number, IssuesAddAssigneesRequest payload) returns IssueSimple|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/assignees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueSimple response = check self.clientEp->post(path, request, targetType=IssueSimple);
        return response;
    }
    # Remove assignees from an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesRemoveAssignees(string owner, string repo, int issue_number, IssuesRemoveAssigneesRequest payload) returns IssueSimple|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/assignees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueSimple response = check self.clientEp->delete(path, request, targetType=IssueSimple);
        return response;
    }
    # List issue comments
    #
    # + issue_number - issue_number parameter
    # + since - Only show notifications updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListComments(string owner, string repo, int issue_number, string? since = (), int? perPage = 30, int? page = 1) returns IssueCommentArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/comments`;
        map<anydata> queryParam = {"since": since, "per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        IssueCommentArr response = check self.clientEp-> get(path, targetType = IssueCommentArr);
        return response;
    }
    # Create an issue comment
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesCreateComment(string owner, string repo, int issue_number, IssuesCreateCommentRequest payload) returns IssueComment|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueComment response = check self.clientEp->post(path, request, targetType=IssueComment);
        return response;
    }
    # List issue events
    #
    # + issue_number - issue_number parameter
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListEvents(string owner, string repo, int issue_number, int? perPage = 30, int? page = 1) returns IssueEventForIssueArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/events`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        IssueEventForIssueArr response = check self.clientEp-> get(path, targetType = IssueEventForIssueArr);
        return response;
    }
    # List labels for an issue
    #
    # + issue_number - issue_number parameter
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListLabelsOnIssue(string owner, string repo, int issue_number, int? perPage = 30, int? page = 1) returns LabelArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/labels`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        LabelArr response = check self.clientEp-> get(path, targetType = LabelArr);
        return response;
    }
    # Set labels for an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesSetLabels(string owner, string repo, int issue_number, record {}|[]|record {}|[]|string payload) returns LabelArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/labels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LabelArr response = check self.clientEp->put(path, request, targetType=LabelArr);
        return response;
    }
    # Add labels to an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesAddLabels(string owner, string repo, int issue_number, record {}|[]|record {}|[]|string payload) returns LabelArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/labels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LabelArr response = check self.clientEp->post(path, request, targetType=LabelArr);
        return response;
    }
    # Remove all labels from an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesRemoveAllLabels(string owner, string repo, int issue_number) returns error? {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/labels`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Remove a label from an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesRemoveLabel(string owner, string repo, int issue_number, string name) returns LabelArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/labels/${name}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        LabelArr response = check self.clientEp-> delete(path, request, targetType = LabelArr);
        return response;
    }
    # Lock an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesLock(string owner, string repo, int issue_number, IssuesLockRequest payload) returns error? {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/lock`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> put(path, request, targetType=http:Response);
    }
    # Unlock an issue
    #
    # + issue_number - issue_number parameter
    # + return - Response
    remote isolated function issuesUnlock(string owner, string repo, int issue_number) returns error? {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/lock`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # List timeline events for an issue
    #
    # + issue_number - issue_number parameter
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListEventsForTimeline(string owner, string repo, int issue_number, int? perPage = 30, int? page = 1) returns TimelineIssueEventsArr|error {
        string  path = string `/repos/${owner}/${repo}/issues/${issue_number}/timeline`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        TimelineIssueEventsArr response = check self.clientEp-> get(path, targetType = TimelineIssueEventsArr);
        return response;
    }
    # List labels for a repository
    #
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListLabelsForRepo(string owner, string repo, int? perPage = 30, int? page = 1) returns LabelArr|error {
        string  path = string `/repos/${owner}/${repo}/labels`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        LabelArr response = check self.clientEp-> get(path, targetType = LabelArr);
        return response;
    }
    # Create a label
    #
    # + return - Response
    remote isolated function issuesCreateLabel(string owner, string repo, IssuesCreateLabelRequest payload) returns Label|error {
        string  path = string `/repos/${owner}/${repo}/labels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Label response = check self.clientEp->post(path, request, targetType=Label);
        return response;
    }
    # Get a label
    #
    # + return - Response
    remote isolated function issuesGetLabel(string owner, string repo, string name) returns Label|error {
        string  path = string `/repos/${owner}/${repo}/labels/${name}`;
        Label response = check self.clientEp-> get(path, targetType = Label);
        return response;
    }
    # Delete a label
    #
    # + return - Response
    remote isolated function issuesDeleteLabel(string owner, string repo, string name) returns error? {
        string  path = string `/repos/${owner}/${repo}/labels/${name}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Update a label
    #
    # + return - Response
    remote isolated function issuesUpdateLabel(string owner, string repo, string name, IssuesUpdateLabelRequest payload) returns Label|error {
        string  path = string `/repos/${owner}/${repo}/labels/${name}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Label response = check self.clientEp->patch(path, request, targetType=Label);
        return response;
    }
    # List milestones
    #
    # + state - The state of the milestone. Either `open`, `closed`, or `all`.
    # + sort - What to sort results by. Either `due_on` or `completeness`.
    # + direction - The direction of the sort. Either `asc` or `desc`.
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListMilestones(string owner, string repo, string? state = "open", string? sort = "due_on", string? direction = "asc", int? perPage = 30, int? page = 1) returns MilestoneArr|error {
        string  path = string `/repos/${owner}/${repo}/milestones`;
        map<anydata> queryParam = {"state": state, "sort": sort, "direction": direction, "per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        MilestoneArr response = check self.clientEp-> get(path, targetType = MilestoneArr);
        return response;
    }
    # Create a milestone
    #
    # + return - Response
    remote isolated function issuesCreateMilestone(string owner, string repo, IssuesCreateMilestoneRequest payload) returns Milestone|error {
        string  path = string `/repos/${owner}/${repo}/milestones`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Milestone response = check self.clientEp->post(path, request, targetType=Milestone);
        return response;
    }
    # Get a milestone
    #
    # + milestone_number - milestone_number parameter
    # + return - Response
    remote isolated function issuesGetMilestone(string owner, string repo, int milestone_number) returns Milestone|error {
        string  path = string `/repos/${owner}/${repo}/milestones/${milestone_number}`;
        Milestone response = check self.clientEp-> get(path, targetType = Milestone);
        return response;
    }
    # Delete a milestone
    #
    # + milestone_number - milestone_number parameter
    # + return - Response
    remote isolated function issuesDeleteMilestone(string owner, string repo, int milestone_number) returns error? {
        string  path = string `/repos/${owner}/${repo}/milestones/${milestone_number}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Update a milestone
    #
    # + milestone_number - milestone_number parameter
    # + return - Response
    remote isolated function issuesUpdateMilestone(string owner, string repo, int milestone_number, IssuesUpdateMilestoneRequest payload) returns Milestone|error {
        string  path = string `/repos/${owner}/${repo}/milestones/${milestone_number}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Milestone response = check self.clientEp->patch(path, request, targetType=Milestone);
        return response;
    }
    # List labels for issues in a milestone
    #
    # + milestone_number - milestone_number parameter
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListLabelsForMilestone(string owner, string repo, int milestone_number, int? perPage = 30, int? page = 1) returns LabelArr|error {
        string  path = string `/repos/${owner}/${repo}/milestones/${milestone_number}/labels`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        LabelArr response = check self.clientEp-> get(path, targetType = LabelArr);
        return response;
    }
    # List user account issues assigned to the authenticated user
    #
    # + filter - Indicates which sorts of issues to return. Can be one of:  
    # + state - Indicates the state of the issues to return. Can be either `open`, `closed`, or `all`.
    # + labels - A list of comma separated label names. Example: `bug,ui,@high`
    # + sort - What to sort results by. Can be either `created`, `updated`, `comments`.
    # + direction - One of `asc` (ascending) or `desc` (descending).
    # + since - Only show notifications updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    # + perPage - Results per page (max 100)
    # + page - Page number of the results to fetch.
    # + return - Response
    remote isolated function issuesListForAuthenticatedUser(string? filter = "assigned", string? state = "open", string? labels = (), string? sort = "created", string? direction = "desc", string? since = (), int? perPage = 30, int? page = 1) returns IssueArr|error {
        string  path = string `/user/issues`;
        map<anydata> queryParam = {"filter": filter, "state": state, "labels": labels, "sort": sort, "direction": direction, "since": since, "per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        IssueArr response = check self.clientEp-> get(path, targetType = IssueArr);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
