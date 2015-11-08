# ch\*rping m\*stard!—the website

This repository contains the source code for _[chirpingmustard.com]_.  The website is generated statically using [Metalsmith] to process files as required (see below).


## Getting started

To get a local copy of the site, clone this repository, fetch the build dependencies and then build it:

    git clone https://github.com/AluisioASG/chirpingmustard.com
    cd chirpingmustard.com
    npm install
    npm run build

Now just point your browser to `_out/index.html` or launch a web server from that directory, if you prefer.


## Build process

The website's files are located in the `content` directory; they are pipelined through Metalsmith to generate the final directory tree in `_out`.  The pipeline consists of the following actions:
- Concatenate and minify CSS stylesheets
- Run HTML files through a Mustache-compatible templating library (currently [Hogan.js])
- Minify HTML files


## Contributing

Feel free to fork this repository and send a pull request with your contribution later, or just open an issue if you're feeling :nail_care:

**Contributors working on features**: please use branches even though you have access to the `master` branch.  Open pull requests unless the feature has been previously agreed upon.  When merging into `master` directly (no pull request), either make a merge commit or squash the feature branch into a single commit.


[chirpingmustard.com]: https://chirpingmustard.com/
[Metalsmith]: http://www.metalsmith.io/
[Hogan.js]: https://twitter.github.io/hogan.js/
