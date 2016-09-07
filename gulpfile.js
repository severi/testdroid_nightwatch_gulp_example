var gulp = require('gulp'),
    nightwatch = require('gulp-nightwatch'),
    inject = require('gulp-inject-string');
 
var credentials = require('./.credentials.json');
var apiKey = credentials["apiKey"];


var build = gulp.src('./nightwatch.json')
  .pipe(inject.replace('<insert_your_apiKey_to_credentials_file>', apiKey))
  .pipe(gulp.dest('./build'));

gulp.task('ios', function() {
  return build
    .pipe(nightwatch({
      configFile: 'build/nightwatch.json',
      cliArgs: [ '--env testdroid_ios']
    }));
});

gulp.task('android', function() {
  return build
    .pipe(nightwatch({
      configFile: 'build/nightwatch.json',
      cliArgs: [ '--env testdroid_android']
    }));
});