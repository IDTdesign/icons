# Grunt Configuration
# http://gruntjs.com/getting-started#an-example-gruntfile

module.exports = (grunt) ->

	# Initiate the Grunt configuration.
	grunt.initConfig

		# Allow use of the package.json data.
		pkg: grunt.file.readJSON('package.json')

		# project path variables
		project:
			bossrev: [ 'src/bossrevolution' ]
			bossrevdefssvg: 'src/bossrevolution/svg-defs.svg'
			bossreviconsjs: 'src/bossrevolution/svg-icons.js'
			bossxgen: [ 'src/bossxgen' ]
			mvno: [ 'src/mvno' ]
			dist: [ 'dist' ]

		#create one svg from multiple files
		svgstore:
			options:
				prefix: 'i--'
				#formatting:
				#   indent_size: 2
				includedemo : '
					<!doctype html>
					<html>
					  <head>
					    <link rel="stylesheet" href="https://idtdesign.github.io/styles/docs.css">
					    <style>
					      svg{
					       width:50px;
					       height:50px;
					       fill: currentColor;
					      }
					    </style>
					  <head>
					  <body class="blog-layout">
					    {{{svg}}}
						<main class="blog-article col-flex-xs">
							<article class="blog-article-content flex-grow-xs">
								<h1>BOSS Revolution Icons</h1>
								<p>&nbsp;</p>
							    {{#each icons}}
							    <div style="float:left; width: 150px; height: 150px; text-align: center;">
							      <svg>
							        <use xlink:href="#{{name}}" />
							      </svg>
							      <div>{{title}}</div>
							    </div>
							    {{/each}}
							</article>
						</main>
					  </body>
					</html>
					'
			bossrev:
				options:
					cleanup: ['fill']
				files: '<%= project.bossrevdefssvg %>':['<%= project.bossrev %>/svg/*.svg']

		#convert content of svg file to string
		svg2string:
			bossrev:
				files: '<%= project.bossreviconsjs %>':['<%= project.bossrevdefssvg %>']

		# optimize images if possible
		imagemin:
			dist:
				options:
					optimizationLevel: 3,
					files: [
						expand: true,
						cwd: '<%= project.dist %>',
						src: ['**/*.{svg,png,jpg,gif}'],
						dest: '<%= project.dist %>'
					]

		# Use Uglify to minify files.
		uglify:
			options:
				preserveComments: 'some'
			# modernizr:
			# 	src: 'bower_components/modernizr/modernizr.js'
			# 	dest: 'out/vendor/modernizr/modernizr.min.js'

		# start server
		connect:
			server:
				options:
					port: 7777
					hostname: '*'
					base: './'
					livereload: true
					# open: true

		# clean dist dir
		clean:
			options:
				force: true
			dist: ['<%= project.dist %>']

		# copy dist files to another repositories
		copy:
			manan:
				files: [
					'../BrCustomer/BrCustomerSite/Content/css/bossrevolution.css':'out/styles/bossrevolution.css'
					'../BrCustomer/BrCustomerSite/Content/css/bossrevolution.css.map':'out/styles/bossrevolution.css.map'
				]

	# measures the time each task takes
	require('time-grunt')(grunt);
	require('load-grunt-tasks')(grunt);

	# Register our Grunt tasks.
	grunt.registerTask 'bossrev', ['svgstore:bossrev', 'svg2string:bossrev']
	grunt.registerTask 'default', []
