"use strict"

gulp = require("gulp")
wiredep = require("wiredep")
modrewrite = require("connect-modrewrite")

# Load plugins
$ = require("gulp-load-plugins")()

# When this is executed, it will run the transformation
# (inject the dependencies into your html)
wiredep({
  directory: "dist/bower_components"
  bowerJson: require("./bower.json")
  src: "app/index.jade"
  ignorePath: "dist/"
})

# Styles
gulp.task "styles", ->
  gulp.src("app/styles/main.scss").pipe($.rubySass(
    style: "expanded"
    loadPath: ["dist/bower_components"]
  )).pipe($.autoprefixer("last 1 version")).pipe($.csso()).pipe(gulp.dest("dist/styles")).pipe $.size()

gulp.task "coffee", ->
  gulp.src("app/scripts/main.coffee", {read: false})
  .pipe($.browserify({
    #insertGlobals: true
    debug: !$.util.env == 'production'
    transform: ["coffeeify"]
    extensions: [".coffee"]
  }))
  .pipe($.concat('bundle.js'))
  .pipe(gulp.dest("dist/scripts")).pipe $.size()

# Scripts
#gulp.task "scripts", ->
#  gulp.src("app/scripts/**/*.js")
#  .pipe($.jshint(".jshintrc"))
#  .pipe($.jshint.reporter("default"))
#  .pipe($.concat("main.js"))
#  .pipe($.uglify())
#  .pipe(gulp.dest("dist/scripts")).pipe $.size()

# Jade
gulp.task "jade", ->
  gulp.src("app/**/*.jade")
  .pipe($.jade())
  .pipe(gulp.dest("dist")).pipe $.size()

# HTML
gulp.task "html", ->
  gulp.src("app/*.html").pipe(gulp.dest("dist")).pipe $.size()

# Images
gulp.task "images", ->
  gulp.src("app/images/**/*").pipe($.cache($.imagemin(
    optimizationLevel: 3
    progressive: true
    interlaced: true
  ))).pipe(gulp.dest("dist/images")).pipe $.size()

#gulp.task "bower", ->
#  $.bower().pipe gulp.dest("dist/bower_components")

# Clean
gulp.task "clean", ->
  gulp.src([
    "dist/styles"
    "dist/scripts"
    "dist/images"
  ],
    read: false
  ).pipe $.clean()

# Build
gulp.task "build", [
#  "html"
  "jade"
  "styles"
  "coffee"
  "images"
]

# Default task
gulp.task "default", ["clean"], ->
  gulp.start "build"

# Connect
gulp.task "connect", $.connect.server(
  root: __dirname + "/dist"
#  root: __dirname + "/app"
  port: 9000
  livereload: true

  middleware: (connect, options) ->
    optBase = (if (typeof options.root is "string") then [options.root] else options.root)
    [modrewrite(["!(\\..+)$ /index.html [L]"])].concat optBase.map((path) ->
      console.log(path)
      connect.static path
    )

#  open: {
#      browser: 'chrome'
#  }
)

# Watch
gulp.task "watch", ["connect"], ->
  # Watch for changes in `app` folder
  gulp.watch [
#    "app/*.html"
    "app/**/*.jade"
    "app/styles/**/*.css"
    "app/scripts/**/*.coffee"
    "app/images/**/*"
  ], $.connect.reload

  # Watch .html files
  gulp.watch "app/**/*.html", ["html"]

  # Watch .jade files
  gulp.watch "app/**/*.jade", ["jade"]

  # Watch .scss files
  gulp.watch "app/styles/**/*.scss", ["styles"]

  # Watch .coffee files
  gulp.watch "app/scripts/**/*.coffee", ["coffee"]

  # Watch image files
  gulp.watch "app/images/**/*", ["images"]

