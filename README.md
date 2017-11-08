# Icons

Icons, source files and svg-sprites for projects.

## Overview

* BOSS Revolution https://idtdesign.github.io/icons/src/bossrevolution/svg-defs-demo.html
* BOSSXGEN https://idtdesign.github.io/icons/src/bossxgen/svg-defs-bossxgen-demo.html
* Bill Pay 
* MVNO 
  * Index https://idtdesign.github.io/icons/src/mvno/svg-defs-mvno-index-demo.html
  * App Index https://idtdesign.github.io/icons/src/mvno/svg-defs-mvno-app-demo.html

## Development

First run:

1. Clone the repo
2. Install project dependencies `npm install`
3. Install Grunt Command Line globally `npm install -g grunt-cli`

Create svg-sprite:

1. Add new icons to `src/[projectname]/svg` folder
2. Run `grunt bossrev` or `grunt bossxgen` or `grunt mvno` to recompile svg-sprite
3. Copy generated `svg-icons-[projectname].js` file to the project repository
