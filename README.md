PJAX for Rails 3.1+
===================

Integrate Chris Wanstrath's [PJAX](https://github.com/defunkt/jquery-pjax) into Rails 3.1+ via the asset pipeline.

This is a fork which:
  * does not strip the pjax param.
  * modifies jquery.pjax to send the server the data-pjax container specified in the client
  * does not try to automatically change the current layout
