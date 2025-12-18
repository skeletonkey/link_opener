# Link Opener

Alfred Workflow to quickly open routine links by a common name.

Why this workflow? Why not use bookmarks? Well, sometimes you need to open a link using a name you know, and it isn't easily accessible via other means. Link Opener lets you open these links quickly.

## Requirements

* Perl 5

## Installation

Find the latest release on the right-hand side of the main [README](https://github.com/skeletonkey/link_opener) page (right side). Download the '.alfredworkflow' file for the release you wish to install. Next, open the file on your desktop - this should open/install the workflow in Alfred.

Once installed, navigate to the workflow and use the "Configure Workflow..." button to customize the workflow keywords and data file.

A hotkey can also be set to activate the workflow, but this is not required.

## Usage

Bring up Alfred, type `link`, then any part of the link 'name'.

Results will be sorted first by 'popularity' (how many times you've used it), then alphabetically.

### Add links

Bring up Alfred and type `link add` followed by the link and (optionally) a human-readable name to find the link. If no 'name' is provided, the last part of the URL is used instead.

### Edit links

To edit links, type `link edit` and the data file will be opened in the default text editor.

For the best experience, save the file and close the editor before using the workflow again.
