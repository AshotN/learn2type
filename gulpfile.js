var gulp = require('gulp');
var stylus = require('gulp-stylus');
var coffee = require('gulp-coffee');
var watch = require('gulp-watch');
var minifyCSS = require('gulp-minify-css');
var uglify = require('gulp-uglify');
var Couleurs = require('couleurs')(true);
var del = require('del');

var paths = {
  stylus: 'client/stylus/**/*.styl',
  coffee: 'client/coffee/**/*.coffee',
  css: 'client/css/*',
  js: 'client/js/*'
};

gulp.task('stylus-compile' , function() {
	console.log("Compiling Stylus".fg(0, 255, 0));
	return gulp.src('client/stylus/main.styl')
		.pipe(stylus())
		.pipe(minifyCSS())
		.pipe(gulp.dest('client/css'));
});

gulp.task('coffee-compile', function() {
	//cleanFiles(paths.js); Possible ASync problem, will fix... one day
	console.log("Compiling Coffee".fg(0, 255, 0));
	return gulp.src(paths.coffee)
		.pipe(coffee().on('error', errorHandle))
		.pipe(uglify())
		.pipe(gulp.dest('client/js'))
});


gulp.task('watch' ,function() {

	gulp.watch(paths.stylus, ['stylus-compile']);
	gulp.watch(paths.coffee, ['coffee-compile']);
});

gulp.task('default', ['watch', 'stylus-compile', 'coffee-compile']);


function errorHandle(error)
{
	console.log(error.toString().fg(255,0,0));
	this.emit('end');
}

function cleanFiles(path)
{
	del(path, function(err, deletedFiles) {
		if(err){
			return console.err("Files Failed To Delete!".fg(255,0,0));
		}
		console.log('Files Deleted: '+ deletedFiles.join(', ').fg(0, 200, 200));
	});
}