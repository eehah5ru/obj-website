$(xml
  (:head
   (:meta :charset "UTF-8")
   (:meta :name "viewport" :content "width=device-width, initial-scale=.75")
   (:title (str (when (bound? title)
		  (echo title " | ")))
	   (str site-name))
   (:link :href "/static/css/app.css" :rel "stylesheet" :type "text/css" )
   (:script :src "/static/js/vendor/jquery.js" :type "text/javascript")   
   (:script :src "/static/js/vendor/modernizr.js" :type "text/javascript")
   (:script :src "/static/js/vendor/what-input.js" :type "text/javascript")      
   (:script :src "/static/js/bower.js" :type "text/javascript")   
   (:script :src "/static/js/app.js" :type "text/javascript")))
