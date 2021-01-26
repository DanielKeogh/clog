(defpackage #:clog-user
  (:use #:cl #:clog)
  (:export start-tutorial))

(in-package :clog-user)

;; In previous tutorials we attached to an html file using bootstrap. For this tutorial we
;; are going to create a bootstrap 4.0 page just using CLOG. For the most part CLOG is about
;; apps but it is possible to do static pages with it. You should also check out a CSS only
;; alternative to bootsrap - https://www.w3schools.com/w3css/default.asp

(defun on-new-window (body)
  (load-css (html-document body) "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css")
  (load-script (html-document body) "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js")
  (load-script (html-document body) "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js")

  (setf (title (html-document body)) "Hello Boostrap")
  
  (let* ((jumbo (create-div body))
	 (tmp   (create-section jumbo :h1 :content "My First Bootstrap Page"))
	 (tmp   (create-p jumbo :content "Resize this responsive page to see the effect!"))

	 (container (create-div body))
	 (row       (create-div container))

	 (col1 (create-div row))
	 (tmp  (create-section col1 :h3 :content "Column 1"))
	 (tmp  (create-p col1 :content "Lorem ipsum dolor.."))
	 
	 (col2 (create-div row))
	 (tmp  (create-section col2 :h3 :content "Column 2"))
	 (tmp  (create-p col2 :content "Lorem ipsum dolor.."))

	 (col3 (create-div row))
	 (tmp  (create-section col3 :h3 :content "Column 3"))
	 (tmp  (create-p col3 :content "Lorem ipsum dolor..")))
    
    (setf (css-class-name jumbo) "jumbotron text-center")
    (setf (css-class-name container) "container")
    (setf (css-class-name row) "row")
    (setf (css-class-name col1) "col-sm-4")
    (setf (css-class-name col2) "col-sm-4")
    (setf (css-class-name col3) "col-sm-4"))
  
  (run body))

(defun start-tutorial ()
  "Start turtorial."

  (initialize #'on-new-window)
  (open-browser))