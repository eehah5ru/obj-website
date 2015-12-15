$(xml
  (:html
   (str (include "header.lisp"))
   
   (:body :data-sticky-container t
	  (str (include "navigation.lisp"))

	  (str (include "teaser.lisp"))
	  
    (str (index-section-from-page :page "about"))
    
    (loop for page in (get-pages "pages")
       do
	 (str (index-section-from-page :page page)))

    (:script :type "text/javascript"
	     "jQuery(document).foundation();"))))

