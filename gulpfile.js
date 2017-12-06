/*jslint node: true */
'use strict';

var gulp           = require('gulp'),
    watch          = require('gulp-watch'),
    prefixer       = require('gulp-autoprefixer'),
    sass           = require('gulp-sass'),
    imagemin       = require('gulp-imagemin'),
    pngquant       = require('imagemin-pngquant'),
    browserSync    = require('browser-sync'),
    cache          = require('gulp-cache'),
    reload         = browserSync.reload;

var path = {

    app: {
        html: 'app/*.html',
        js: 'app/js/*.js',
        scss: 'app/scss/*.scss',
        css: 'app/css/*.css',
        img: 'app/img/**/*.*',
        fonts: 'app/fonts/**/*.*'
    },

    watch: {
        html: 'app/**/*.html',
        js: 'app/js/**/*.js',
        scss: 'app/scss/**/*.scss',
        css: 'app/css/**/*.css',
        img: 'app/img/**/*.*',
        fonts: 'app/fonts/**/*.*'
    }
};

var config = {
    server: {
        baseDir: "./app"
    },
    tunnel: false,
    host: 'localhost',
    port: 8081,
    browser: "firefox",
    logPrefix: "MAXDV"
};

gulp.task('html:build', function () {
    gulp.src(path.app.html)
        .pipe(reload({stream: true}));
});

gulp.task('js:build', function () {
    gulp.src('app/js/main.js')
      .pipe(reload({stream: true}));
});

gulp.task('scss:build', function () {
    gulp.src("app/scss/main.scss")
        .pipe(sass())
        .pipe(prefixer(['last 15 version', '> 1%', 'ie 8']))
        .pipe(gulp.dest("app/css"))
        .pipe(reload({stream: true}));
});

gulp.task('build', [
    'html:build',
    'js:build',
    'scss:build'
]);

gulp.task('watch', function () {
    watch([path.watch.html], function (event, cb) {
        gulp.start('html:build');
    });
    watch([path.watch.scss], function (event, cb) {
        gulp.start('scss:build');
    });
    watch([path.watch.js], function (event, cb) {
        gulp.start('js:build');
    });
});

gulp.task('webserver', function () {
    browserSync(config);
});

gulp.task('clear', function () {
    return cache.clearAll();
});

gulp.task('default', ['build', 'webserver', 'watch']);
