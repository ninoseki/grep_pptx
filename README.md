# Grep in Microsoft Powerpoint (pptx) files

## Summary

Find a keyword in pptx file(s).

**Note:** This repository is a fork of [kaityo256/grep_pptx](https://github.com/kaityo256/grep_pptx).

## How to install

TODO.

## Usage

```bash
$ grep_pptx grep [KEYWORD] [PATH]  # grep [KEYWORD] to [PATH]

# give a path to a pptx file.
$ grep_pptx grep hoge /path/to/pptx_files
# or give a path to a directory (it will search pptx file(s) in the directory)
$ grep_pptx grep hoge /path/to/directory
```

### Example

```bash
$ grep_pptx grep and spec/fixtures/hoge.pptx
find "and" in spec/fixtures/hoge.pptx at slide 1
find "and" in spec/fixtures/hoge.pptx at slide 2
find "and" in spec/fixtures/hoge.pptx at slide 3
find "and" in spec/fixtures/hoge.pptx at slide 4
find "and" in spec/fixtures/hoge.pptx at slide 5
find "and" in spec/fixtures/hoge.pptx at slide 6
...
```
