module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    sass: {
      options: {
        includePaths: ['bower_components/foundation-sites/',
		       'bower_components/foundation-sites/scss',
		      ]
      },
      dist: {
        options: {
          outputStyle: 'nested',
          sourceMap: 'inline',
	  lineNumbers: true
        },
        files: {
          'static/css/app.css': 'scss/app.scss'
        }
      }
    },

    bower_concat: {
      all:
      {
	exclude: [
	  'jquery',
	  'modernizr',
	  'what-input'	  
	],
	dest: 'static/js/bower.js',
	dependencies: {

	  // 'foundation-sites': ['jquery'
	  // 		      ]
	  
	}
      }
    },

    bowercopy: {
      options: {
	srcPrefix: 'bower_components'
      },
      scripts: {
	options: {
	  destPrefix: 'static/js'
	},
	files: {
	  'jquery.js': 'jquery/dist/jquery.js',
	  'modernizr.js': 'modernizr/modernizr.js',
	  'what-input.js': 'what-input/what-input.js'
	}
      }      
    },

    watch: {
      grunt: {
        options: {
          reload: true
        },
        files: ['Gruntfile.js']
      },

      sass: {
        files: 'scss/**/*.scss',
        tasks: ['sass']
      }
    }
  });

  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-bower-concat');
  grunt.loadNpmTasks('grunt-bowercopy');
  
  grunt.registerTask('build', ['sass', 'bowercopy', 'bower_concat']);
  grunt.registerTask('default', ['build','watch']);
};
