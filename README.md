# ⚠️ Do not embed youtube videos, as this seems to conflict with DSGVO ⚠️ 

# Landing Page Generator for Publications 
This Repository contains a bash script to generate landing pages for publications using `pandoc`. These are minimalistic and consist only of a single `.html` file that can conveniently be hosted (e.g. using github pages).

## Installation:
- install [pandoc](https://github.com/jgm/pandoc/releases). Version 2.18 works well, while for ubuntu 22, the `apt` installable version did not.
- Install `rsync`. Probably your linux distribution already provides this and this step can be omitted.
- For convenience, create an alias for the `build_landing_page.sh` script, by adding to your `.bashrc` the following line (replacing the path with your installation directory):
```bash
alias gen_landing_page='~/path/to/this/dir/build_landing_page.sh'
```

## Getting Started:
- create a `src` directory, `cd` into it and create an `index.md`. (Alternatively, just copy the `example` folder and use this as a basis)
- put images in a folder called `static` that is located in the `src` folder.
- edit `index.md` to your liking. You can also directly enter `html` code.
- run `gen_landing_page` from within the `src` folder. This will generate a `build` folder next to the `src`folder
- pandoc might print this Warning `[WARNING] Could not fetch resource static/logo.svg`. However, it seems as if this can safely be ignored.
- manually deploy the contens of `build` (e.g. to gh pages) or run `python3 -m http.server` for previewing the site locally.

## Notes on using gh pages
- put the contents of `build` inside a `doc` foler at the root of your repository.
- pages settings can be found under `settings`, `pages`. make sure to select the right branch and folder.
- more info [here](https://pages.github.com/)

## resources
- stylesheet based on [this one](https://gist.github.com/killercup/5917178)
- template based on the pandoc default one
