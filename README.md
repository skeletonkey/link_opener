# Link Opener

Alfred Workflow to quickly open routine links by a common name.

## Usage

Bring up Alfred and type `link` and then any part of the link 'name'.

Results will be sorted first by 'popularity' (how many times you've used it), then alphabetically.

### Add links

Currently, URLs need to be manually added to `.linkopener.dat` file in Workflow dir.  Simply add a new URL to the bottom of the file.  The 'search term' will be the last part of the URL.  If you want it to be something else then add a '|' with the name. Make sure that the URL *does NOT* end with a '/'.

Examples:

```
https://github.com/skeletonkey/link_opener
https://github.com/jsumners/alfred-emoji|Emoji
```
