$(xml
  (:html
   (:head
    (:meta :charset "UTF-8")
    (:title (str (when (bound? title)
		   (echo title " | ")))
	    (str site-name))
    (:link :href "/static/css/app.css" :rel "stylesheet" :type "text/css" )
    (:script :src "/static/js/bower.js" :type "text/javascript")   
    (:script :src "/static/js/app.js" :type "text/javascript"))

   (:body
    (:nav :class "top-bar"
	  :role "navigation"
	  :data-topbar t
	  (:ul :class "title-area"
	       (:li :class "name"
		    (:h1 (:a :href "/" (str (site-name)))))
	       ;; (:li :class "toggle-topbar menu-icon"
	       ;; 	    (:a :href "#"
	       ;; 		(:span (str "Menu"))))
	       )
 	  (:section :class "top-bar-section show-for-small-up"
		    (str (other-languages-2 :ul-class "right"
					  :selected-class "active"))))
    (:header :class "text-center"
     (:h1 (str (title))))
    (:article :class "row"
	      (:div :class "small-12 large-10 large-offset-1 columns"
		    (str (contents))))

    (:script :type "text/javascript"
	     "alert(\"1123123\")"))))

