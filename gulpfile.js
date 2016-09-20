var gulp = require('gulp'),
    nightwatch = require('gulp-nightwatch'),
    inject = require('gulp-inject-string');
 
var build = gulp.src('./nightwatch.json').pipe(gulp.dest('./build'));

gulp.task('ios', function() {
  return build
    .pipe(nightwatch({
      configFile: 'build/nightwatch.json',
      cliArgs: [ '--env testdroid_ios','--verbose']
    }));
});

gulp.task('android', function() {
  return build
    .pipe(nightwatch({
      configFile: 'build/nightwatch.json',
      cliArgs: [ '--env testdroid_android','--verbose']
    }));
});