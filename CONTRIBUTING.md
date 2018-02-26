# Contributing #

## Summary ##

- [Setup](#setup)
- [Branching Model](#branching-model)
  - [Master](#master)
  - [Develop](#develop)
  - [Patterns](#patterns)
- [Commits](#commits)
- [Unit testing](#unit-testing)
- [Linting](#linting)
- [Issue checklist](#issue-checklist)
- [Pull request checklist](#pull-request-checklist)

## Setup ##

To get started on contributing on `JamfKit` you'll need to clone the repository from `GitHub`.

Next step will be to verify that you're using **XCode 9.2**.

Once those two steps are completed, you'll be able to start contributing to `JamfKit`.

We recommend the usage of the following useful tools:

- [Visual Studio Code](https://code.visualstudio.com)
- [SwiftLint](https://github.com/realm/SwiftLint)

## Branching model ##

The current branching model of `JamfKit` is built upon [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model) from [Vincent Driessen](http://nvie.com).

Every single change that targets the main branches (master, develop) can only be merged through a pull request, which we greatly encourage.

### Master ###

This very peculiar branch is used only for hosting the releases of `JamfKit`.

Apart from the code coming from the release branches, it is allowed to create pull request to merge hotfixes and documentation fixes.

To perform a new release, a branch (named like **release/release-x.x.x**) must be created from the **develop** branch. Once all the preparatory work is done, a pull request (named like **Release x.x.x**) must be created with **master** as the target.

Once everything is settled on the pull request (version bump, up-to-date documentation, hotfixes, etc.) it will be merged into **master**. Right after, a new tag (named like **x.x.x**) will be associated with the merge commit.

### Develop ###

This branch can be considered as the main working branch, every change toward the next release is staged here until the next release branch is created.

You're free to rebase on develop whenever you need to get the latest change in your branch.

### Patterns ###

All branches inside `JamfKit` needs to be named by following one of the pattern below:

- feature/{branch_name}
- bug/{branch_name}
- release/{branch_name}
- hotfix/{branch_name}

Pull requests coming from branches which are not matching any of those pattern will be declined.

## Commits ##

Before commiting anything to you branch, make sure to add relevant message and description to your commit.

If you need to some insights on how to actually do this, here's some very interesting readings:

- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit)
- [What makes a good commit message?](https://hackernoon.com/what-makes-a-good-commit-message-995d23687ad)

## Unit testing ##

Since all the public objects of `JamfKit` are based upon the JSS API's payload, `JamfKit` relies heavily on unit testing to ensure that every single object is matching it's JSON counterpart.

New objects must be committed alongside their unit tests so every breaking changes in the API or missing implementations can be monitored.

## Linting ##

Currently, `JamfKit` includes the `SwiftLint` script to enforce a general quality of the code.

You're free to skip installing `SwiftLint` if you prefer not to bother, it won't break the build workflow of the library.

## Issue checklist ##

- [ ] Issue tracker does not already contain the same (or a very similar) issue
- [ ] Title must be clear about what is the issue
- [ ] Description will be pre-filled with a template, all relevant fields must be filled

Before opening an issue (whether it's related to a new feature or a bug), please be aware that it can be closed at any time if it's not following the code of conduct or if it's content is not considered as an useful contribution to `JamfKit`.

## Pull request checklist ##

- [ ] Title must be clear about what will change
- [ ] Description must contain a comprehensive explanation of what changed and links toward related issues
- [ ] Unit tests must put in place for every single new object
- [ ] New objects must be fully documented (inline + README)

Before opening a pull request, please be aware that it can be declined at any time if it's not following the code of conduct or if it's content is not considered as an useful contribution to `JamfKit`.
