jQuery(function($) {
    //----------------------Input select------------------------
    $("input[type=text], textarea").focus(function() {
        $(this).addClass('text-focus');
    });

    $("input, textarea").blur(function() {
        $(this).removeClass("text-focus");
    });


    //-------------------------watermarks----------------------------
    $('#nameBox').watermark('имя', { className: 'watermark' });
    $('#phoneBox').watermark('телефон', { className: 'watermark' });
    $('#mailBox').watermark('эмейл', { className: 'watermark' });
    $('#messageBox').watermark('сообщение', { className: 'watermark' });

    function ResetFBForm() {
        $('#fbFormTable input, #messageBox').val('');
        $.watermark.showAll();
    }


    //------------------------------main menu links--------------------------
    $('.portfolio').click(function() {
        $.scrollTo('#portfolio', 500, function() {
            window.location.hash = "portfolio";
        });
    });


    $('.studio').click(function() {
        $.scrollTo('#studio', 500, function() {
            window.location.hash = "studio";
        });
    });

    $('.contacts').click(function() {
        $.scrollTo('#contacts', 500, function() {
            window.location.hash = "contacts";
        });
    });

    $('#toTop').click(function() {
        $.scrollTo('.corner-top', 500, {});
    });


    $(document).scroll(function() {
        var scrollPosition = $(window).scrollTop();
        if (scrollPosition > 800) {
            $('#toTop').fadeIn('slow');
        }
        else {
            $('#toTop').fadeOut('slow');
        }
    });

    //-------------------------------Portfolio-----------------------------
    $('#PortfolioGalery').delegate('.p-link', 'click', OpenPortfolioWindow);

    var $currentPortfolioContainer;
    function OpenPortfolioWindow(e) {
        $currentPortfolioContainer = $('#' + $(this).attr('portfolio') + 'Container');
        //portfolioContainer = $(this).attr('portfolio') + 'Container';

        if (!$currentPortfolioContainer.length == 0) {

            //$('body').css('overflow', 'hidden');

            if (!$currentPortfolioContainer.hasClass('p-loaded')) {

                $currentPortfolioContainer.wrscroll({ target: $currentPortfolioContainer.find('.p-slider') });

                //Define portfolio center coordinates  (Do not del)
                //$currentPortfolioContainer.bind('click', DefinePortfolioCenter);

                //console.log('not loaded');

                $currentPortfolioContainer.find('img').each(function(idx, el) {
                    var src = $(el).attr('srcAtr');
                    //$(el).attr('src', src);

                    $(el).attr('src', src).load(function() {

                        if ($(el).hasClass('p-img')) {
                            $(el).removeClass('p-img');
                        }
                        //$(el).css('background-image', 'none');
                    });

                    $(el).removeAttr('srcAtr');
                });

                $currentPortfolioContainer.addClass('p-loaded');
            }
            else {
                var $sliderElement = $currentPortfolioContainer.find('.p-slider');
                var top = $sliderElement.attr('top');
                var left = $sliderElement.attr('left');

                $sliderElement.css({ 'top': top, 'left': left }, "slow");

                //console.log('loaded');
            }

        }

        $currentPortfolioContainer.slideDown(600, function() {
            $('#PortfolioNavigation').fadeIn(100);
        });

    }

    function DefinePortfolioCenter() {
        var left = $(this).find('.p-slider').css('left');
        var top = $(this).find('.p-slider').css('top');

        console.log('top : ' + top + ' | ' + 'left : ' + left);
    };


    var mouseScroll = {
        count: 0,
        delta: 4,
        dir: 1,
        shift: false,
        config: {
            step: function() { },
            complete: function() { }
        }
    };

    $('#PortfolioContainer').mousewheel(function(event, delta) {
        if (event.ctrlKey || $(this).hasClass('wrscroll-disabled'))
            return;

        var dir = delta > 0 ? 1 : -1, shift = event.shiftKey;

        if (mouseScroll.dir != dir || mouseScroll.shift != shift)
            mouseScroll.count = 0;

        mouseScroll.dir = dir;
        mouseScroll.shift = shift;
        mouseScroll.count += 150;
        mouseScroll.count = Math.min(mouseScroll.count, 600);

        var $sliderElement = $currentPortfolioContainer.find('.p-slider');

        $sliderElement.stop(true);

        if (shift) {
            $sliderElement.animate({ left: '+=' + dir * mouseScroll.count }, $.extend({}, mouseScroll.config));
            event.preventDefault();
        } else {
            $sliderElement.animate({ top: '+=' + dir * mouseScroll.count }, $.extend({}, mouseScroll.config));
        }
    });


    $('#ClosePortfolio').click(function() {

    $('#PortfolioNavigation').fadeOut(100, function() {
            $('#' + $currentPortfolioContainer.attr('id') + ' ,#PortfolioNavigation').slideUp(600, function() {
                // $('body').css('overflow', 'auto');
            });
        });


    });

    $('#OnStartPortfolio').click(function() {

        var $sliderElement = $currentPortfolioContainer.find('.p-slider');
        var top = $sliderElement.attr('top');
        var left = $sliderElement.attr('left');

        $sliderElement.animate({ 'top': top, 'left': left }, "slow");

    });


    //------------------------send mail----------------------------

    $('#send').click(function() {
        SendFeedBack();
    });

    function SendFeedBack() {
        LoaderShow();
        $('#send').unbind('click');

        $.post("handlers/FeedBack.ashx", { name: $('#nameBox').val(),
            mail: $('#mailBox').val(),
            phone: $('#phoneBox').val(),
            message: $('#messageBox').val()
        },
                                    function(data) {
                                        LoaderHide();

                                        data = $.parseJSON(data);

                                        if (data.Result == 'Success') {
                                            $('#fbFormTable').fadeOut('slow', function() {
                                                ResetFBForm();
                                                $('#fbSuccess').fadeIn('slow');
                                            });

                                        }
                                        else {
                                            //console.log(data.Result);
                                            $('#fbFormTable').fadeOut('slow', function() {
                                                $('#fbFail').fadeIn('slow'); //ResetFBForm();
                                            });

                                        }

                                    });
    }

    $('.fbMore').click(function() {

        $('#send').bind('click', SendFeedBack);

        $(this).parent('div').fadeOut('slow', function() {
            $('#fbFormTable').fadeIn('slow');
        })

    });

    //loader init
    $('#loader').css({
        'width': screen.width,
        'height': screen.height,
        'padding-top': $(window).height() / 2
    });


    function LoaderShow() {
        $('#loader').show();
    }

    function LoaderHide() {
        $('#loader').hide();
    }


});