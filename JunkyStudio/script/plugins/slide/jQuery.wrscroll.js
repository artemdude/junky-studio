/*!
* jQuery.wrscroll JavaScript Plugin v1.0
*
* Based on http://azoffdesign.com/plugins/js/overscroll, v.1.2.1
*
* Copyright 2010, WebRiders, Rostislav Bryzgunov
* Dual licensed under the MIT or GPL Version 2 licenses.
* http://jquery.org/license
*
* Usage: $(el).wrscroll();
*
* Changes:
*     + Main modification: scollLeft/scrollTop replaced with dragging (absolute position + CSS left/top)
*     + Removed mousewheel scrolling (because it was unstable and not cross-browser)
*     + Added "enable" and "disable":
*         $(el).wrscroll("disable");  $(el).wrscroll("enable");
*         $(el).wrscroll({ enable: false });  $(el).wrscroll({ enable: true });
*     + Scroll replaced with drag
*     + Added source element (initiates drag when another target element is actually dragged):
*         $('.source-el').wrscroll({ target: '.another-element-selector' })
*     + Added indicators for current actions:
*         $.fn.config.disabledClass: 'overscroll-disabled'
*         $.fn.config.draggingClass: 'overscroll-dragging'
*         $.fn.config.easingClass:   'overscroll-easing'
*/

(function($, o) {

    // create wrscroll
    o = $.fn.wrscroll = function(options) {

        // Shortcuts for enable and disable
        if (typeof options == "string") {
            var opts = {};
            switch (options) {
                case "enable": opts.enable = true; break;
                case "disable": opts.enable = false; break;
            }
            options = opts;
        }

        options = options || {};

        if (options.enable === true)
            return this.each(o.enable);

        if (options.enable === false)
            return this.each(o.disable);

        return this.each(function() {
            o.init(null, this, options.target);
        });
    };

    $.extend(o, {
        enable: function(data, source) {
            return $(source).removeClass(o.config.disabledClass).css({ cursor: "url(" + o.icons.open + "), default" });
        },

        disable: function(data, source) {
            return $(source).addClass(o.config.disabledClass).css({ cursor: "" });
        },

        // overscroll icons
        icons: {
            open: "images/cursors/hand/openhand.cur",
            closed: "images/cursors/hand/closedhand.cur"
        },

        // events handled by overscroll
        events: {
            start: "select mousedown touchstart",
            drag: "mousemove touchmove",
            end: "mouseup mouseleave touchend",
            ignored: "dragstart drag"
        },

        // main initialization function
        init: function(data, source, target) {
            data = {};
            target = target || source;

            data.source = $(source)
				.css({ "cursor": "url(" + o.icons.open + "), default", "overflow": "hidden" })
				.bind(o.events.start, data, o.start)
				.bind(o.events.end, data, o.stop)
				.bind(o.events.ignored, function() { return false; }); // disable proprietary drag handlers

            data.target = $(target);

            // Init target offset
            if (data.target.css('position') !== 'absolute') {
               // var ofs = data.target.offset();

               //console.log(data.target.attr('top'));

                data.target.css({
                    position: 'absolute',
                    left: data.target.attr('left'),
                    top: data.target.attr('top')
                });
            }
        },

        // starts the drag operation and binds the mouse move handler
        start: function(event) {
            if (event.data.source.hasClass(o.config.disabledClass))
                return;

            event.data.source
				.css("cursor", "url(" + o.icons.closed + "), default")
				.bind(o.events.drag, event.data, o.drag)
                .addClass(o.config.draggingClass); // Add dragging indicator

            event.data.target.stop(true, true);

            event.data.position = {
                x: event.pageX,
                y: event.pageY
            };

            event.data.capture = {};

            event.data.isDragging = false;

            return false;
        },

        // updates the current scroll location during a mouse move
        drag: function(event) {
            if (event.data.source.hasClass(o.config.disabledClass))
                return;

            $(event.data.target).css({
                left: parseInt($(event.data.target).css('left')) + (event.pageX - event.data.position.x),
                top: parseInt($(event.data.target).css('top')) + (event.pageY - event.data.position.y)
            });

            event.data.position.x = event.pageX;
            event.data.position.y = event.pageY;

            if (typeof event.data.capture.index === "undefined" || --event.data.capture.index === 0) {
                event.data.isDragging = true;
                event.data.capture = {
                    x: event.pageX,
                    y: event.pageY,
                    index: o.config.captureThreshold
                };
            }

            return true;
        },

        // ends the drag operation and unbinds the mouse move handler
        stop: function(event) {
            if (event.data.source.hasClass(o.config.disabledClass))
                return;

            // Remove dragging indicator
            event.data.source.removeClass(o.config.draggingClass);

            if (typeof event.data.position !== "undefined") {

                event.data.source
					.css("cursor", "url(" + o.icons.open + "), default")
					.unbind(o.events.drag, o.drag);

                if (event.data.isDragging) {
                    // Add easing indicator
                    event.data.source.addClass(o.config.easingClass);

                    var dx = o.config.scrollDeltaMod * (event.pageX - event.data.capture.x),
						dy = o.config.scrollDeltaMod * (event.pageY - event.data.capture.y);
                    event.data.target.stop(true, true).animate({
                        left: parseInt($(event.data.target).css('left')) + dx,
                        top: parseInt($(event.data.target).css('top')) + dy
                    }, {
                        queue: false,
                        duration: o.config.scrollDuration,
                        easing: "cubicEaseOut",
                        complete: function() {
                            // Remove easing indicator
                            event.data.source.removeClass(o.config.easingClass);
                        }
                    });

                }

                event.data.capture = event.data.position = undefined;
            }

            return !event.data.isDragging;
        },

        config: {
            scrollDuration: 800,
            captureThreshold: 4,
            wheelDeltaMod: -400,
            scrollDeltaMod: 4.7,
            disabledClass: 'wrscroll-disabled',
            draggingClass: 'wrscroll-dragging',
            easingClass: 'wrscroll-easing'
        }

    });

    // jQuery adapted Penner animation
    //    created by Jamie Lemon
    $.extend($.easing, {

        cubicEaseOut: function(p, n, firstNum, diff) {
            var c = firstNum + diff;
            return c * ((p = p / 1 - 1) * p * p + 1) + firstNum;
        }

    });

})(jQuery);
