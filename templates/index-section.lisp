$(xml
  (:section :class "row"
   (when-accessor-xml 'sub-title
		      (:div :class "vertical-title-wrapper"
			    (:div :class "vertical-title"
				  (:h5 :class "vertical-text"
				       (str (sub-title))))))
   (:header :class "row small-12 columns"
	    (:h1 :class "small-12 columns"
		 (:a :href (current-page-address)
		     (str (title))))
	    ;; (when-accessor-xml 'sub-title
	    ;; 		       (:h2 :class "small-12 columns"
	    ;; 			    (str (sub-title))))
	    )
   (:article :class "row small-12 columns"
	     ;; (:div :class "small-12 columns"
	     ;; 	   (when-accessor-xml 'video-contents
	     ;; 			      (:div :class "video-wrapper"
	     ;; 				    (str (video-contents)))))
	     ;; (when-accessor-xml 'sub-title
	     ;; 			(:div :class "small-1 columns"
	     ;; 			      (:h2 :class "vertical-text"
	     ;; 				  (str (sub-title)))))
	     (:div :class "small-12 columns"
		   (with-one-of-accessors a-content (index-contents contents)
					  (str a-content))))))
