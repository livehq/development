gulp = require('gulp')
runSequence = require('run-sequence')
coffee = require('gulp-coffee')
concat = require('gulp-concat')
uglify = require('gulp-uglify')
jasmine = require('gulp-jasmine')
wrap = require('gulp-wrap-umd')

config = {
  src: {
    main: ['src/main/**/*.coffee']
    spec: ['src/spec/**/*.coffee']
  } 
  dist: {
    folder: 'build'
    file: 'devise.js'
    minFile: 'devise.min.js'
  }
}

gulp.task 'scripts', ->
  # Minify and copy all JavaScript (except vendor scripts)
  gulp.src(config.src.main).pipe(coffee()).pipe(concat(config.dist.file)).pipe gulp.dest(config.dist.folder)
  #gulp.src(config.src.main).pipe(coffee()).pipe(uglify()).pipe(concat(config.dist.file)).pipe gulp.dest(config.dist.folder)

# Rerun the task when a file changes
gulp.task 'watch', ->
  gulp.watch config.src.main, ['scripts']

gulp.task 'jasmine', ->
  gulp.src(config.src.spec).pipe jasmine() 

gulp.task 'spec', (callback) ->
  runSequence('jasmine', callback)

gulp.task 'ugly-scripts', ->
  gulp.src(config.src.main).pipe(coffee()).pipe(uglify()).pipe(concat(config.dist.minFile)).pipe gulp.dest(config.dist.folder)

gulp.task 'dist', (callback) ->
  runSequence('scripts', 'ugly-scripts', 'spec', callback)

# The default task (called when you run `gulp` from cli)
gulp.task 'default', (callback) ->
  runSequence('scripts', 'spec', callback)
