gulp = require("gulp")
plumber = require("gulp-plumber")

coffee = require("gulp-coffee")
less = require("gulp-less")
concat = require("gulp-concat")

DIST = "build/"

lesspath = "styles/*.css"
coffeepath = "scripts/*.coffee"

gulp.task "less", ->
  gulp.src(lesspath)
  .pipe(plumber())
  .pipe(less())
  .pipe(concat("style.css"))
  .pipe(gulp.dest(DIST))

gulp.task "coffee", ->
  gulp.src(coffeepath)
  .pipe(plumber())
  .pipe(coffee())
  .pipe(concat("app.js"))
  .pipe(gulp.dest(DIST))


# Rerun the task when a file changes
gulp.task "watch", ->
  gulp.watch lesspath, ["less"]
  gulp.watch coffeepath, ["coffee"]

gulp.task "default", [
  "less"
  "coffee"
]
