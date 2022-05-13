#!/usr/bin/env ruby
require_relative "./app/services/github_checks_verifier"
require "octokit"

# allowed_conclusions = ENV["ALLOWED_CONCLUSIONS"]
# check_name = ENV["CHECK_NAME"]
# check_regexp = ENV["CHECK_REGEXP"]
# ref = ENV["REF"]
# branch = ENV["GIT_BRANCH"]
# token = ENV["REPO_TOKEN"]
# verbose = ENV["VERBOSE"]
# wait = ENV["WAIT_INTERVAL"]
# timeout = ENV["TIMEOUT"]
# workflow_name = ENV["RUNNING_WORKFLOW_NAME"]

GithubChecksVerifier.configure do |config|
  config.allowed_conclusions = ENV["ALLOWED_CONCLUSIONS"].split(",").map(&:strip)
  config.check_name = ENV["CHECK_NAME"]
  config.check_regexp = ENV["CHECK_REGEXP"]
  config.client = Octokit::Client.new(access_token: ENV["REPO_TOKEN"])
  config.ref = ENV["GIT_BRANCH"]
  config.branch = ENV["GITHUB_SHA"]
  config.repo = ENV["GITHUB_REPOSITORY"]
  config.verbose = ENV["VERBOSE"]
  config.wait = ENV["WAIT_INTERVAL"].to_i
  config.timeout = ENV["TIMEOUT"].to_i
  config.workflow_name =  ENV["RUNNING_WORKFLOW_NAME"]
end

GithubChecksVerifier.call
