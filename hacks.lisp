;; (load #p"~/quicklisp/setup.lisp")
;; (ql:quickload 'cl-ansi-text)

;; (let ((current-pkg-name (package-name *package*)))
;;   (in-package :site-generator)
;;   (export '(:*content-dir*
;; 	    :*template-dir*))
;;   (in-package current-pkg-name))

;; (format *error-output* "PACKAGE: ~A" *package*)

(defun other-languages-2 (&key (ul-class "languages") (selected-class "current-langage"))
  "String &key (ul-class String) (selected-class String) -> String
Return an HTML list of links to the current page in all languages."
  (let ((page (get-data :current-file)))
    (xml
     (:ul :class ul-class
	  (loop for lang in (get-data :languages)
	     do (if (eq lang (get-data :lang))
		    (htm (:li :class selected-class
			      (:a :href "#" (str (symbol-name lang)))))
		    (htm (:li (:a :href (page-address page :lang lang)
				  (str (symbol-name lang)))))))))))


;; (defun index-section-from-page (&key (page))
;;   (xml
;;    (:section :class ""
;; 	     (:header :class "row"
;; 		      (:h1 :class "small-12 text-center"
;; 			   (:a :href (page-address page)
;; 			       (str (get-content page :title)))))
;; 	     (:article :class "row"
;; 		       (:div :class "small-12"
;; 			     (let ((page-markup (get-content page :markup))
;; 				   (page-content (get-content page :contents)))
;; 			       (cl-ansi-text:with-color (:green
;; 					    :stream *error-output*)
;; 				 (format *error-output*
;; 					 "markup for ~A: ~A~%"
;; 					 (page-title page)
;; 					 page-markup))
			       
;; 			       (cond ((eq page-markup :none)
;; 				      (str page-content))
;; 				     (t (str (markup page-content
;; 							     :markup page-markup))))))))))

(defun index-section-from-page (&key (page))
  (let ((index-template (get-content page :index-template)))
    ;; (obj-debug "page: ~A, index template: ~A~%"
    ;; 	       (list (page-title page) index-template))
    (unless index-template
      (error (with-output-to-string (out)
	       (format out "index template should be present for page ~A" page))))

    (handler-case
	(progn
	  (render-with-template index-template page))
      (template-error (e)
	(progn
	  (obj-error "got error ~A while rendering ~A~%"
		     (template-error-text e)
		     page)
	  (error e))))))


(defun video-mixin ()
  (cl-ansi-text:with-color (:green
			    :stream *error-output*)
    (format *error-output* "CURRENT-PAGE ~A~%" (get-data :current-file))
  
    (format *error-output* "CURRENT_PAGE_TITLE ~A~%" (page-title (get-data :current-file)))))

(defun make-keyword (name)
  "makes keyword from string"
  (values (intern (string-upcase name) :keyword)))

(defun tt (sym-name)
  (let ((data-name (make-keyword (concatenate 'string
						"t-"
						(string sym-name)))))
    (get-data data-name)))


(defun obj-debug (&rest format-args)
  (obj-log :yellow format-args))

(defun obj-error (&rest format-args)
  (obj-log :red format-args))

(defun obj-log (color format-args)
  (cl-ansi-text:with-color (color
			    :stream *error-output*)
    (apply #'format (append (list *error-output*) format-args))))


